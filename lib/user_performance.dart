import 'dart:math';

enum LearnerType {
  visual,
  readingWriting,
  kinesthetic
}

class QuestionTypePerformance {
  int correct = 0;
  int total = 0;
  List<double> responseTimes = [];
  
  double get accuracy => total > 0 ? correct / total : 0.0;
  double get averageResponseTime => responseTimes.isNotEmpty ? 
    responseTimes.reduce((a, b) => a + b) / responseTimes.length : 
    0.0;
    
  // Higher score is better (higher accuracy, lower response time)
  double get performanceScore {
    if (total == 0) return 0.0;
    double timeScore = responseTimes.isEmpty ? 0.5 : 
      max(0.0, 1.0 - (averageResponseTime / 30.0)); // Normalize time (assumes 30s is max)
    return (accuracy * 0.7) + (timeScore * 0.3); // Weight accuracy more
  }
  
  void addResult(bool correct, double responseTime) {
    this.total++;
    if (correct) this.correct++;
    this.responseTimes.add(responseTime);
  }
}

class UserPerformance {
  final Map<String, QuestionTypePerformance> _typePerformance = {
    'visualQuestion': QuestionTypePerformance(),
    'multipleChoice': QuestionTypePerformance(),
    'openEnded': QuestionTypePerformance(),
  };
  
  // Track session question count
  int _sessionQuestionCount = 0;
  
  int get sessionQuestionCount => _sessionQuestionCount;
  
  // Add method to update session question count
  void addSessionQuestions(int count) {
    _sessionQuestionCount += count;
  }
  
  // Reset session data
  void resetSession() {
    _sessionQuestionCount = 0;
    _typePerformance.forEach((key, performance) {
      performance.correct = 0;
      performance.total = 0;
      performance.responseTimes = [];
    });
  }
  
  QuestionTypePerformance getPerformance(String type) {
    return _typePerformance[type] ?? QuestionTypePerformance();
  }
  
  void addResult(String type, bool correct, double responseTime) {
    if (!_typePerformance.containsKey(type)) {
      _typePerformance[type] = QuestionTypePerformance();
    }
    _typePerformance[type]!.addResult(correct, responseTime);
  }
  
  // Get preferred learner type based on performance
  LearnerType get learnerType {
    var visual = getPerformance('visualQuestion').performanceScore;
    var multipleChoice = getPerformance('multipleChoice').performanceScore;
    var openEnded = getPerformance('openEnded').performanceScore;
    if (visual > multipleChoice && visual > openEnded) {
      return LearnerType.visual;
    } else if (openEnded > visual && openEnded > multipleChoice) {
      return LearnerType.readingWriting;
    } else {
      return LearnerType.kinesthetic;
    }
  }
  
  String get learnerTypeDescription {
    switch (learnerType) {
      case LearnerType.visual:
        return "Visual Learner: You seem to learn best with images and visual content!";
      case LearnerType.readingWriting:
        return "Reading/Writing Learner: You excel at questions that require reading and writing!";
      case LearnerType.kinesthetic:
        return "Kinesthetic Learner: You perform best with interactive multiple choice questions!";
    }
  }
  
  Map<String, double> get typeSelectionWeights {
    double total = 0;
    Map<String, double> weights = {};
    _typePerformance.forEach((type, performance) {
      weights[type] = performance.performanceScore + 0.1;
      total += weights[type]!;
    });
    weights.forEach((type, weight) {
      weights[type] = weight / total;
    });
    return weights;
  }
}

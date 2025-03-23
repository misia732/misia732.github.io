import 'package:flutter/material.dart';
import 'package:flutter_application_1/question.dart';
import 'package:flutter_application_1/question_bank.dart';
import 'package:flutter_application_1/user_performance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'GeoGrasp'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  Widget build(BuildContext context) {
    // Create a shared performance tracker
    UserPerformance userPerformance = UserPerformance();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Reset session when starting from home
                Set<String> previouslyCorrect = {};
                Set<String> incorrectQuestions = {};
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizConfigPage(
                    isPersonalized: false,
                    previouslyCorrect: previouslyCorrect,
                    incorrectQuestions: incorrectQuestions,
                  )),
                );
              },
              child: const Text('Randomized'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reset session when starting from home
                userPerformance.resetSession();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizConfigPage(
                    isPersonalized: true,
                    previouslyCorrect: {},
                    incorrectQuestions: {},
                    userPerformance: userPerformance,
                  )),
                );
              },
              child: const Text('Personalized'),
            ),
          ],
        ),
      ),
    );
  }
}

// RANDOMIZED START
class RandomizedPage extends StatefulWidget {
  final Set<String> previouslyCorrect;
  final Set<String> incorrectQuestions;
  final int questionCount;

  const RandomizedPage({
    super.key, 
    required this.previouslyCorrect, 
    required this.questionCount,
    required this.incorrectQuestions,
  });

  @override
  State<RandomizedPage> createState() => _RandomizedPageState();
}

class _RandomizedPageState extends State<RandomizedPage> {
  late List<Question> _questions;
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  TextEditingController _answerController = TextEditingController();
  Set<String> _newlyCorrect = {}; // Track correct answers in this session
  Set<String> _incorrectInThisSession = {}; // Track incorrect answers in this session
  
  // Add feedback state variables
  bool _showFeedback = false;
  bool _isCorrect = false;
  
  @override
  void initState() {
    super.initState();
    _questions = QuestionBank.getFilteredQuestions(widget.questionCount, widget.previouslyCorrect);
  }

  void _checkAnswer() {
    bool isCorrect = false;
    Question currentQuestion = _questions[_currentIndex];
    
    if (currentQuestion.type == QuestionType.multipleChoice || 
        currentQuestion.type == QuestionType.visualQuestion) {
      isCorrect = _selectedAnswer == currentQuestion.correctAnswer;
    } else {
      // For open-ended questions, normalize answers for comparison
      String userAnswer = _answerController.text.trim().toLowerCase();
      String correctAnswer = currentQuestion.correctAnswer.toLowerCase();
      isCorrect = userAnswer == correctAnswer;
    }
    
    // Show feedback instead of immediately moving to next question
    setState(() {
      _showFeedback = true;
      _isCorrect = isCorrect;
    });
    
    if (isCorrect) {
      _score++;
      _newlyCorrect.add(currentQuestion.id); // Save correct question ID
    } else {
      _incorrectInThisSession.add(currentQuestion.id); // Track incorrect answers in this session
    }
  }
  
  void _moveToNextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
        _answerController.clear();
        _showFeedback = false; // Reset feedback for next question
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(
            score: _score, 
            total: _questions.length, 
            previouslyCorrect: {...widget.previouslyCorrect, ..._newlyCorrect},
            incorrectQuestions: {...widget.incorrectQuestions, ..._incorrectInThisSession},
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: const Center(
          child: Text("You've practiced every question you learned! Good job!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      );
    }

    final question = _questions[_currentIndex];
    // Check if this question was previously incorrect
    bool wasPreviouslyIncorrect = widget.incorrectQuestions.contains(question.id);

    return Scaffold(
      appBar: AppBar(title: Text('Question ${_currentIndex + 1} / ${_questions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q${_currentIndex + 1}: ${question.question}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Show "Tricky one" message ONLY if this question was incorrect in a previous session
            if (wasPreviouslyIncorrect) ...[
              Text(
                "Tricky one! Give it another shot!",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
            ],
            
            // Display image for visual questions
            if (question.type == QuestionType.visualQuestion && question.imageAsset != null) ...[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    question.imageAsset!,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
            
            // Different UI based on question type
            if (!_showFeedback) ...[
              if (question.type == QuestionType.multipleChoice || 
                  question.type == QuestionType.visualQuestion) ...[
                Column(
                  children: question.options.map((option) {
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          _selectedAnswer = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ] else ...[
                // Open-ended question UI
                TextField(
                  controller: _answerController,
                  decoration: InputDecoration(
                    hintText: 'Type your answer here',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {}); // Refresh UI to update button state
                  },
                ),
              ],
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (question.type != QuestionType.openEnded && _selectedAnswer == null) || 
                           (question.type == QuestionType.openEnded && _answerController.text.trim().isEmpty) 
                         ? null 
                         : _checkAnswer,
                child: const Text("Check Answer"),
              ),
            ] else ...[
              // Feedback UI
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isCorrect ? Colors.green.shade100 : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _isCorrect ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _isCorrect ? Icons.check_circle : Icons.cancel,
                          color: _isCorrect ? Colors.green : Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text(
                          _isCorrect ? "Correct!" : "Incorrect",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _isCorrect ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    if (!_isCorrect) ...[
                      SizedBox(height: 8),
                      Text(
                        "The correct answer is: ${question.correctAnswer}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                    SizedBox(height: 8),
                    Text(
                      _isCorrect 
                          ? "Great job! You got it right." 
                          : "Don't worry, you'll remember it next time!",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _moveToNextQuestion,
                child: Text(_currentIndex < _questions.length - 1 ? "Next Question" : "See Results"),
              ),
            ],
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }
}
// RANDOMIZED END 

// PERSONALISED START

class PersonalizedPage extends StatefulWidget {
  final UserPerformance userPerformance;
  final int questionCount;
  final Set<String> previouslyCorrect;
  final Set<String> incorrectQuestions;
  
  const PersonalizedPage({
    super.key, 
    required this.userPerformance, 
    required this.questionCount,
    required this.previouslyCorrect,
    required this.incorrectQuestions,
  });

  @override
  State<PersonalizedPage> createState() => _PersonalizedPageState();
}

class _PersonalizedPageState extends State<PersonalizedPage> {
  late List<Question> _questions;
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  TextEditingController _answerController = TextEditingController();
  Set<String> _newlyCorrect = {}; 
  Set<String> _incorrectInThisSession = {}; // Track incorrect answers in this session
  
  // Timing
  DateTime? _questionStartTime;
  
  // Feedback state variables
  bool _showFeedback = false;
  bool _isCorrect = false;
  
  @override
  void initState() {
    super.initState();
    _questions = QuestionBank.getPersonalizedQuestions(
      widget.questionCount, 
      widget.previouslyCorrect, 
      widget.userPerformance
    );
    _questionStartTime = DateTime.now();
    
    // Update session question count
    widget.userPerformance.addSessionQuestions(_questions.length);
  }

  void _checkAnswer() {
    // Calculate response time
    double responseTime = _questionStartTime != null ? 
        DateTime.now().difference(_questionStartTime!).inMilliseconds / 1000 : 0;
        
    bool isCorrect = false;
    Question currentQuestion = _questions[_currentIndex];
    
    if (currentQuestion.type == QuestionType.multipleChoice || 
        currentQuestion.type == QuestionType.visualQuestion) {
      isCorrect = _selectedAnswer == currentQuestion.correctAnswer;
    } else {
      String userAnswer = _answerController.text.trim().toLowerCase();
      String correctAnswer = currentQuestion.correctAnswer.toLowerCase();
      isCorrect = userAnswer == correctAnswer;
    }
    
    // Record performance data
    String questionType = currentQuestion.type.toString().split('.').last;
    widget.userPerformance.addResult(questionType, isCorrect, responseTime);
    
    setState(() {
      _showFeedback = true;
      _isCorrect = isCorrect;
    });
    
    if (isCorrect) {
      _score++;
      _newlyCorrect.add(currentQuestion.id);
    } else {
      _incorrectInThisSession.add(currentQuestion.id); // Track incorrect answers in this session
    }
  }
  
  void _moveToNextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
        _answerController.clear();
        _showFeedback = false;
        _questionStartTime = DateTime.now(); // Start timing next question
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalizedResultsPage(
            score: _score, 
            total: _questions.length, 
            sessionTotal: widget.userPerformance.sessionQuestionCount,
            previouslyCorrect: {
              ...widget.previouslyCorrect, 
              ..._newlyCorrect
            },
            incorrectQuestions: {
              ...widget.incorrectQuestions,
              ..._incorrectInThisSession
            },
            userPerformance: widget.userPerformance,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: const Center(
          child: Text("You've practiced every question you learned! Good job!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      );
    }

    final question = _questions[_currentIndex];
    // Check if this question was previously incorrect
    bool wasPreviouslyIncorrect = widget.incorrectQuestions.contains(question.id);

    return Scaffold(
      appBar: AppBar(title: Text('Question ${_currentIndex + 1} / ${_questions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q${_currentIndex + 1}: ${question.question}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Show "Tricky one" message ONLY if this question was incorrect in a previous session
            if (wasPreviouslyIncorrect) ...[
              Text(
                "Tricky one! Give it another shot!",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
            ],
            
            // Display image for visual questions
            if (question.type == QuestionType.visualQuestion && question.imageAsset != null) ...[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    question.imageAsset!,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
            
            // Different UI based on question type
            if (!_showFeedback) ...[
              if (question.type == QuestionType.multipleChoice || 
                  question.type == QuestionType.visualQuestion) ...[
                Column(
                  children: question.options.map((option) {
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          _selectedAnswer = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ] else ...[
                // Open-ended question UI
                TextField(
                  controller: _answerController,
                  decoration: InputDecoration(
                    hintText: 'Type your answer here',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {}); // Refresh UI to update button state
                  },
                ),
              ],
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (question.type != QuestionType.openEnded && _selectedAnswer == null) || 
                           (question.type == QuestionType.openEnded && _answerController.text.trim().isEmpty) 
                         ? null 
                         : _checkAnswer,
                child: const Text("Check Answer"),
              ),
            ] else ...[
              // Feedback UI - same as RandomizedPage
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isCorrect ? Colors.green.shade100 : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _isCorrect ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _isCorrect ? Icons.check_circle : Icons.cancel,
                          color: _isCorrect ? Colors.green : Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text(
                          _isCorrect ? "Correct!" : "Incorrect",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _isCorrect ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    if (!_isCorrect) ...[
                      SizedBox(height: 8),
                      Text(
                        "The correct answer is: ${question.correctAnswer}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                    SizedBox(height: 8),
                    Text(
                      _isCorrect 
                          ? "Great job! You got it right." 
                          : "Don't worry, you'll remember it next time!",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _moveToNextQuestion,
                child: Text(_currentIndex < _questions.length - 1 ? "Next Question" : "See Results"),
              ),
            ],
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }
}
// PERSONALISED END 

// RESULTS START
class ResultsPage extends StatelessWidget {
  final int score;
  final int total;
  final Set<String> previouslyCorrect;
  final Set<String> incorrectQuestions;

  const ResultsPage({
    super.key, 
    required this.score, 
    required this.total, 
    required this.previouslyCorrect,
    required this.incorrectQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Results")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Score: $score / $total",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back to Home"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizConfigPage(
                          isPersonalized: false,
                          previouslyCorrect: previouslyCorrect,
                          incorrectQuestions: incorrectQuestions,
                          questionCount: total,
                        ),
                      ),
                    );
                  },
                  child: const Text("Play Again"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// RESULTS END

// PERSONALISED RESULTS START

class PersonalizedResultsPage extends StatelessWidget {
  final int score;
  final int total;
  final int sessionTotal;  // Add session total count
  final Set<String> previouslyCorrect;
  final Set<String> incorrectQuestions;
  final UserPerformance userPerformance;

  const PersonalizedResultsPage({
    super.key, 
    required this.score, 
    required this.total, 
    required this.sessionTotal,
    required this.previouslyCorrect,
    required this.incorrectQuestions,
    required this.userPerformance
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Results")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Score: $score / $total",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // Learning style feedback
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade200),
              ),
              child: Column(
                children: [
                  Text(
                    "Learning Style Insight",
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    userPerformance.learnerTypeDescription,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Performance statistics
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Performance by Question Type",
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildPerformanceRow(
                    "Visual Questions", 
                    userPerformance.getPerformance('visualQuestion')
                  ),
                  SizedBox(height: 8),
                  _buildPerformanceRow(
                    "Multiple Choice", 
                    userPerformance.getPerformance('multipleChoice')
                  ),
                  SizedBox(height: 8),
                  _buildPerformanceRow(
                    "Open Ended", 
                    userPerformance.getPerformance('openEnded')
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Reset session when going back to home
                    userPerformance.resetSession();
                    Navigator.pop(context);
                  },
                  child: const Text("Back to Home"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizConfigPage(
                          isPersonalized: true,
                          userPerformance: userPerformance,
                          previouslyCorrect: previouslyCorrect,
                          incorrectQuestions: incorrectQuestions,
                        ),
                      ),
                    );
                  },
                  child: const Text("Play Again"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPerformanceRow(String title, QuestionTypePerformance performance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          "${performance.total > 0 ? '${(performance.accuracy * 100).toStringAsFixed(1)}%' : 'N/A'} " +
          "(${performance.correct}/${performance.total})" +
          "${performance.responseTimes.isNotEmpty ? ' • ${performance.averageResponseTime.toStringAsFixed(1)}s avg' : ''}"
        ),
      ],
    );
  }
}

// PERSONALISED RESULTS END

class QuizConfigPage extends StatefulWidget {
  final bool isPersonalized;
  final Set<String> previouslyCorrect;
  final Set<String> incorrectQuestions;
  final UserPerformance? userPerformance;
  final int? questionCount;
  
  const QuizConfigPage({
    super.key, 
    required this.isPersonalized, 
    required this.previouslyCorrect,
    required this.incorrectQuestions,
    this.userPerformance,
    this.questionCount,
  });

  @override
  State<QuizConfigPage> createState() => _QuizConfigPageState();
}

class _QuizConfigPageState extends State<QuizConfigPage> {
  late int _questionCount;
  
  @override
  void initState() {
    super.initState();
    _questionCount = widget.questionCount ?? 5;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Configuration")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How many questions would you like?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Slider(
              value: _questionCount.toDouble(),
              min: 5,
              max: 10,
              divisions: 5,
              label: _questionCount.toString(),
              onChanged: (value) {
                setState(() {
                  _questionCount = value.toInt();
                });
              },
            ),
            Text(
              "$_questionCount Questions",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (widget.isPersonalized) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalizedPage(
                        userPerformance: widget.userPerformance!,
                        questionCount: _questionCount,
                        previouslyCorrect: widget.previouslyCorrect,
                        incorrectQuestions: widget.incorrectQuestions,
                      ),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RandomizedPage(
                        previouslyCorrect: widget.previouslyCorrect,
                        questionCount: _questionCount,
                        incorrectQuestions: widget.incorrectQuestions,
                      ),
                    ),
                  );
                }
              },
              child: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
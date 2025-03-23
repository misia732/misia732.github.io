enum QuestionType {
  multipleChoice,
  openEnded,
  visualQuestion,  // Add this new type
}

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final QuestionType type;
  final String id;
  final String? imageAsset;  // Add this new field
  
  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.type,
    required this.id,
    this.imageAsset,  // Optional parameter
  });
}
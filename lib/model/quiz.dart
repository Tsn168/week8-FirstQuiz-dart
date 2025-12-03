class Quiz {
  final String question;
  final List<String> answers;
  final int correctIndex;

  Quiz({
    required this.question,
    required this.answers,
    required this.correctIndex,
  });

  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctIndex;
  }

  String get correctAnswer => answers[correctIndex];
}


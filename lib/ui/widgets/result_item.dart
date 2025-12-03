import 'package:flutter/material.dart';

/// ResultItem - STATELESS
/// Parameters:
///   - questionNumber (int): Question number to display
///   - questionText (String): The question text
///   - answers (List<String>): All answer options
///   - correctIndex (int): Index of correct answer
///   - userAnswerIndex (int): Index of user's answer
/// States: None
/// Why Stateless: Pure display widget, all data passed from parent
class ResultItem extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final List<String> answers;
  final int correctIndex;
  final int userAnswerIndex;

  const ResultItem({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.answers,
    required this.correctIndex,
    required this.userAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = userAnswerIndex == correctIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question number with colored circle
          CircleAvatar(
            radius: 16,
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            child: Text(
              '$questionNumber',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Question and answers
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question text
                Text(
                  questionText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),

                // All answers with indicators
                ...List.generate(answers.length, (index) {
                  final bool isUserAnswer = index == userAnswerIndex;
                  final bool isCorrectAnswer = index == correctIndex;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        // Checkmark for correct answer
                        if (isCorrectAnswer)
                          const Icon(Icons.check, color: Colors.green, size: 18)
                        else
                          const SizedBox(width: 18),
                        const SizedBox(width: 8),

                        // Answer text
                        Text(
                          answers[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: isCorrectAnswer
                                ? Colors.green
                                : (isUserAnswer ? Colors.red : Colors.black54),
                            fontWeight: (isCorrectAnswer || isUserAnswer)
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

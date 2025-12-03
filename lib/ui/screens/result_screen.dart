import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/result_item.dart';
import 'welcome_screen.dart';

/// ResultScreen - STATELESS
/// Parameters:
///   - score (int): User's final score
///   - totalQuestions (int): Total number of questions
///   - questions (List<Quiz>): All quiz questions
///   - userAnswers (List<int>): User's answers for each question
/// States: None
/// Why Stateless: Only displays final results, all data passed from QuestionScreen
class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Quiz> questions;
  final List<int> userAnswers;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Score header
              Text(
                'You answered $score on $totalQuestions !',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // Results list
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.separated(
                    itemCount: questions.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final quiz = questions[index];
                      return ResultItem(
                        questionNumber: index + 1,
                        questionText: quiz.question,
                        answers: quiz.answers,
                        correctIndex: quiz.correctIndex,
                        userAnswerIndex: userAnswers[index],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Restart button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

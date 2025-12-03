import 'package:flutter/material.dart';
import '../../data/quiz_data.dart';
import '../../model/quiz.dart';
import '../widgets/answer_option.dart';
import 'result_screen.dart';

/// QuestionScreen - STATEFUL
/// Parameters: None
/// States:
///   - currentQuestionIndex (int): Tracks which question user is on
///   - selectedAnswerIndex (int?): Which answer user selected (null = none)
///   - score (int): User's current score
///   - isAnswered (bool): Prevents multiple selections
///   - userAnswers (List<int>): Stores all user answers for result screen
/// Why Stateful: Needs to track quiz progress, user selections, and score
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // ==================== STATES ====================
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  bool isAnswered = false;
  List<int> userAnswers = [];

  // ==================== DATA ====================
  final List<Quiz> questions = QuizData.questions;

  // ==================== METHODS ====================
  void _selectAnswer(int index) {
    if (!isAnswered) {
      setState(() {
        selectedAnswerIndex = index;
        isAnswered = true;
        userAnswers.add(index);

        // Update score if correct using Quiz model method
        if (questions[currentQuestionIndex].isCorrect(index)) {
          score++;
        }
      });

      // Auto-advance to next question after 1 second
      Future.delayed(const Duration(seconds: 1), () {
        _nextQuestion();
      });
    }
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isAnswered = false;
      });
    } else {
      // Quiz complete - go to results
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: questions.length,
            questions: questions,
            userAnswers: userAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Quiz currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF2196F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Progress text
              Text(
                'Question ${currentQuestionIndex + 1} of ${questions.length}',
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Progress bar
              LinearProgressIndicator(
                value: (currentQuestionIndex + 1) / questions.length,
                backgroundColor: Colors.white30,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 50),

              // Question text
              Text(
                currentQuestion.question,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Answer options
              Expanded(
                child: ListView.separated(
                  itemCount: currentQuestion.answers.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return AnswerOption(
                      text: currentQuestion.answers[index],
                      isSelected: selectedAnswerIndex == index,
                      onTap: () => _selectAnswer(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

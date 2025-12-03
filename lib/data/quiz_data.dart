import '../model/quiz.dart';

class QuizData {
  static final List<Quiz> questions = [
    Quiz(
      question: 'Who is the best teacher?',
      answers: ['LeangSiv', 'Ronan', 'Hongly'],
      correctIndex: 1,
    ),
    Quiz(
      question: 'Who is the best student?',
      answers: ['somnang', 'rayu', 'someth'],
      correctIndex: 0,
    ),
  ];
}

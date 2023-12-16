import 'question.dart';

class AppQuizzure {
  int _questionNumber = 0;

  List<Question> _questionGroup = [
    Question(
      q: 'The number of planets in the solar system is 6',
      i: 'images/image-1.jpg',
      a: false,
    ),
    Question(
      q: 'Cats are carnivores',
      i: 'images/image-2.jpg',
      a: true,
    ),
    Question(
      q: 'China is an Asian country',
      i: 'images/image-3.jpg',
      a: true,
    ),
    Question(
      q: 'The earth is flat',
      i: 'images/image-4.jpg',
      a: false,
    ),
    Question(
      q: 'Humans can survive without eating meat',
      i: 'images/image-5.jpg',
      a: true,
    ),
    Question(
      q: 'The sun revolves around the earth and the earth revolves around the moon',
      i: 'images/image-6.jpg',
      a: false,
    ),
    Question(
      q: 'Animals do not feel pain',
      i: 'images/image-7.jpg',
      a: false,
    ),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }
}

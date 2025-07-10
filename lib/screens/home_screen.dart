import 'package:flutter/material.dart';
import 'package:SmartPrep/widgets/option_card.dart';
import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/result_box.dart';

class HomeScreen extends StatefulWidget {
  final String category;
  const HomeScreen({super.key, required this.category});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  // All questions with categories
  final List<Question> _allQuestions = [
    // WEB DEVELOPMENT
    Question(
      id: '10',
      category: 'WEB DEVELOPMENT',
      title: 'What does HTML stand for?',
      options: {
        'Hyperlinks and Text Markup Language': false,
        'HyperText Markup Language': true,
        'Home Tool Markup Language': false,
        'HyperText Machine Language': false,
      },
    ),
    Question(
      id: '11',
      category: 'WEB DEVELOPMENT',
      title: 'Which HTML tag is used to create a hyperlink?',
      options: {
        '<a>': true,
        '<link>': false,
        '<href>': false,
        '<url>': false,
      },
    ),
    // ...add more WEB DEVELOPMENT questions...
    // PROGRAMMING
    Question(
      id: '20',
      category: 'PROGRAMMING',
      title: 'Which keyword is used to define a function in Python?',
      options: {
        'func': false,
        'def': true,
        'function': false,
        'define': false,
      },
    ),
    // ...add more PROGRAMMING questions...
    // GK
    Question(
      id: '30',
      category: 'GK',
      title: 'What is the capital of France?',
      options: {
        'Berlin': false,
        'Madrid': false,
        'Paris': true,
        'Rome': false,
      },
    ),
    // ...add more GK questions...
  ];

  late List<Question> _questions;
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  @override
  void initState() {
    super.initState();
    // Filter questions by selected category
    _questions = _allQuestions
        .where((q) => q.category == widget.category)
        .toList();
    // If no questions found, show all as fallback
    if (_questions.isEmpty) {
      _questions = _allQuestions;
    }
  }

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          result: score,
          questionLength: _questions.length,
          onPressed: startOver,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Smartprep - ${widget.category}'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
      body: _questions.isEmpty
          ? const Center(child: Text('No questions for this category.'))
          : Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  QuestionWidget(
                    indexAction: index,
                    question: _questions[index].title,
                    totalQuestions: _questions.length,
                  ),
                  const Divider(color: neutral),
                  const SizedBox(height: 25.0),
                  for (int i = 0; i < _questions[index].options.length; i++)
                    GestureDetector(
                      onTap: () => checkAnswerAndUpdate(
                          _questions[index].options.values.toList()[i]),
                      child: OptionCard(
                        option: _questions[index].options.keys.toList()[i],
                        color: isPressed
                            ? _questions[index].options.values.toList()[i] == true
                                ? correct
                                : incocorrect
                            : neutral,
                      ),
                    ),
                ],
              ),
            ),
      floatingActionButton: _questions.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: NextButton(
                nextQuestion: nextQuestion,
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
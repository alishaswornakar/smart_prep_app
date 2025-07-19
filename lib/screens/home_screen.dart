import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../widgets/next_button.dart';
import '../widgets/result_box.dart';

class HomeScreen extends StatefulWidget {
  final String category;
  const HomeScreen({super.key, required this.category});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> _allQuestions = [
    // Add your questions here as before...
    Question(
      id: '10',
      category: 'WEB DEVELOPMENT',
      title: 'What does HTML stand for?',
      options: {
        'Hyperlinks & Text Markup Language': false,
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
         '<link>': false,
        '<a>': true,
        '<href>': false,
        '<url>': false,
      },
    ),
    Question(id: '12', category: 'WEB DEVELOPMENT', title: 'Which of the following is not a valid HTTP method?', options:
        {
          'GET': false,
          'POST': false,
          'PUT': false,
          'PUSH': true,
        },
      ),
      Question(
      id: '13',
      category: 'WEB DEVELOPMENT',
      title: 'Which tag is used to define a client-side script in HTML?',
      options: {'<style>': false,
        '<script>': true,
        '<code>': false,
        '<js>': false,
      },
    ),
    Question(
      id: '14',
      category: 'WEB DEVELOPMENT',
      title: 'Which protocol is used to secure communications over a network?',
      options: {
        'HTTP': false,
        'HTTPS': true,
        'FTP': false,
        'SMTP': false,
      },
    ),
    
    Question(
      id: '15',
      category: 'WEB DEVELOPMENT',
      title: 'What does CSS stand for?',
      options: {
        'Cascading Style Sheets': true,
        'Computer Style Sheets': false,
        'Creative Style Sheets': false,
        'Colorful Style Sheets': false,
      },
    ),
    Question(
      id: '16',
      category: 'WEB DEVELOPMENT',
      title: 'Which of the following is a valid way to include an external JavaScript file?',
      options: {
        '<script href="file.js">': false,
        '<script link="file.js">': false,
        '<script src="file.js">': true,
        '<script file="file.js">': false,
      },
    ),
    Question(
      id: '17',
      category: 'WEB DEVELOPMENT',
      title: 'Which HTML element is used to define the structure of a webpage?',
       options: {
        '<section>': false,
        '<div>': true,
        '<article>': false,
        '<header>': false,
      },
    ),
    Question(
      id: '18',
      category: 'WEB DEVELOPMENT',
      title: 'In CSS, which property controls the text size?',
      options: {
        'font-size': true,
        'text-size': false,
        'font-style': false,
        'text-style': false,
      },
    ),
    Question(
      id: '19',
      category: 'WEB DEVELOPMENT',
      title: 'Which HTML tag is used to define an unordered list?',
      options: {
      
        '<ol>': false,
        '<li>': false,
        '<ul>': true,
        '<list>': false,
      },
    ),
    Question(
      id: '20',
      category: 'WEB DEVELOPMENT',
      title: 'What does the "alt" attribute in an <img> tag specify?',
      options: {
        'The image source': false,
        'The image description': true,
        'The image size': false,
        'The image title': false,
      },
    ),
    Question(
      id: '21',
      category: 'WEB DEVELOPMENT',
      title: 'Which CSS property is used to change the background color of an element?',
      options: {
        'color': false,
        'bg-color': false,
        'background': false,
        'background-color': true,
      },
    ),
       Question(
      id: '22',
      category: 'WEB DEVELOPMENT',
      title: 'What does the this keyword refer to in JavaScript (in object method)?',
      options: {
        'The current object': true,
        'The global object': false,
        'The parent object': false,
        'The previous object': false,
      },
    ),
    Question(
      id: '23',
      category: 'WEB DEVELOPMENT',
      title: 'Which CSS property is used to make a webpage responsive?',
      options: {
        'flex': false,
        'grid': false,
        'media queries': true,
        'responsive': false,
      },
    ),
    Question(
      id: '24',
      category: 'WEB DEVELOPMENT',
      title: 'Which one is not a JavaScript data type?',
      options: {
        'String': false,
        'Number': false,
        'Boolean': false,
        'float': true,
      },
    ),
    Question(
      id: '25',
      category: 'WEB DEVELOPMENT',
      title: 'Which HTML tag is used to define a table row?',
      options: {
        '<tr>': true,
        '<td>': false,
        '<th>': false,
        '<table>': false,
      },
    ),
    
    Question(
      id: '26',
      category: 'WEB DEVELOPMENT',
      title: 'Which database is commonly used in web development for storing user data?',
      options: {
      
        'MongoDB': false,
        'SQLite': false,
         'MySQL': true,
        'PostgreSQL': false,
      },
    ),
    Question(
      id: '27',
      category: 'WEB DEVELOPMENT',
      title: 'Which is not a valid value of the position property in CSS?',
      options: {
        'static': false,
        'relative': false,
        'absolute': false,
        'centered': true,
        
      },
    ),
    Question(
      id: '28',
      category: 'WEB DEVELOPMENT',
      title: 'Which HTML tag is used to define a form?',
      options: {
        '<form>': true,
        '<input>': false,
        '<button>': false,
        '<field>': false,
      },
    ),
    Question(
      id: '29',
      category: 'WEB DEVELOPMENT',
      title: 'Which CSS property is used to change the font of an element?',
      options: {
        'font-family': true,
        'font-style': false,
        'font-weight': false,
        'text-font': false,
      },
    ),
    Question(
      id: '30',
      category: 'PROGRAMMING',
      title: 'Which of the following is a valid variable name in most programming languages?',
      options: {
        '123value': false,
        'value_123': true,
        'value-123': false,
        'value 123': false,
      },
    ),
    Question(
      id: '31',
      category: 'PROGRAMMING',
      title: 'What is the output of print(2 ** 3) in Python?',
      options: {
        '8': true,
        '6': false,
        '9': false,
        '16': false,
      },
    ),
    Question(
      id: '32',
      category: 'PROGRAMMING',
      title: 'Which of the following is not a programming paradigm?',
      options: {
        'Object-Oriented Programming': false,
        'Functional Programming': false,
        'Procedural Programming': false,
        'Imperative Programming': true,
      },
    ),
    Question(
      id: '33',
      category: 'PROGRAMMING',
      title: 'Which of the following is not a loop structure in C?',
      options: {
        'for': false,
        'do-while': false,
        'repeat-until': true,
        'while': false,
      },
    ),
    Question(
      id: '34',
      category: 'PROGRAMMING',
      title: 'In Java, which keyword is used to inherit a class?',
      options: {
        'extends': true,
        'inherits': false,
        'implements': false,
        'super': false,
      },
    ),
    Question(
      id: '35',
      category: 'PROGRAMMING',
      title: 'Which is not a feature of Object-Oriented Programming (OOP)?',
      options: {
        'Encapsulation': false,
        'Inheritance': false,
        'Polymorphism': false,
        'compilation': true,
      },
    ),
    Question(
      id: '36',
      category: 'PROGRAMMING',
      title: 'Which of these is a dynamically typed language?',
      options: {
        'Java': false,
        'C++': false,
        'Python': true,
        'C#': false,
      },
    ),
    Question(
      id: '37',
      category: 'PROGRAMMING',
      title: 'Which language uses indentation to define code blocks?',
      options: {
        'Python': true,
        'Java': false,
        'C++': false,
        'JavaScript': false,
      },
    ),
    Question(
      id: '38',
      category: 'PROGRAMMING',
      title: 'Which of the following is a valid comment in C++?',
      options: {
        '-- This is a comment --': false,
        '# This is a comment': false,
        'This is a comment': false,
        '// This is a comment': true,
      },
    ),
    Question(
      id: '39',
      category: 'PROGRAMMING',
      title: 'Which of the following is not a valid data type in Java?',
      options: {
        'int': false,
        'float': false,
        'string': true,
        'boolean': false,
      },
    ),
    Question(
      id: '40',
      category: 'PROGRAMMING',
      title: 'Which of the following is a valid way to declare a constant in Java?',
      options: {
        'const int x = 10;': false,
        'final int x = 10;': true,
        'int x = 10; const': false,
        'constant int x = 10;': false,
      },
    ),
    Question(
      id: '41',
      category: 'PROGRAMMING',
      title: 'Which of these is not a valid access modifier in C++?',
      options: {
        'public': false,
        'private': false,
        'protected': false,
        'internal': true,
      },
    ),
    Question(
      id: '42',
      category: 'PROGRAMMING',
      title: 'Which of the following is a valid way to declare an array in Java?',
      options: {
        'int[] arr = new int[5];': true,
        'int arr[5];': false,
        'int arr = new int[5];': false,
        'array int arr[5];': false,
      },
    ),
    Question(
      id: '43',
      category: 'PROGRAMMING',
      title: 'Which of the following is not a valid loop structure in Python?',
      options: {
        'for': false,
        'while': false,
        'do-while': true,
        'foreach': false,
      },
    ),
    Question(
      id: '44',
      category: 'PROGRAMMING',
      title: 'Which statement is used to terminate a loop in most programming languages?',
      options: {
        'exit': false,
        'break': true,
        'stop': false,
        'end': false,
      },
    ),
    Question(
      id: '45',
      category: 'PROGRAMMING',
      title: 'Which keyword is used to prevent a class from being inherited in Java?',
      options: {
        'final': true,
        'static': false,
        'private': false,
        'sealed': false,
      },
    ),
    Question(
      id: '46',
      category: 'PROGRAMMING',
      title: 'Which of the following is a valid way to handle exceptions in Java?',
      options: {
        'try-catch': true,
        'catch-try': false,
        'throw-catch': false,
        'exception-try': false,
      },
    ),
    Question(
      id: '47',
      category: 'PROGRAMMING',
      title: 'What will be the output of: printf("%d", 5/2); in C?',
      options: {
        
        '2.5': false,
        '3': false,
        '2': true,
        '1': false,
      },
    ),
    Question(
      id: '48',
      category: 'PROGRAMMING',
      title: 'What is the purpose of a constructor in OOP?',
      options: {
        'To initialize an object': true,
        'To destroy an object': false,
        'To create a class': false,
        'To inherit a class': false,
      },
    ),
    Question(
      id: '49',
      category: 'PROGRAMMING',
      title: 'Which of the following is not a valid way to declare a function in JavaScript?',
      options: {
        'function myFunction() {}': true,
        'const myFunction = () => {}': false,
        'myFunction() {}': false,
        'function myFunction() => {}': false,
      },
    ),

    
    // ... more questions ...
    Question(
      id: '50',
      category: 'GK',
      title: 'What is the capital of France?',
      options: {
        'Berlin': false,
        'Madrid': false,
        'Paris': true,
        'Rome': false,
      },
    ),
    Question(
      id: '51',
      category: 'GK',
      title: 'Who wrote "To Kill a Mockingbird"?',
      options: {
        'Harper Lee': true,
        'Mark Twain': false,
        'Ernest Hemingway': false,
        'F. Scott Fitzgerald': false,
      },
    ),
    Question(
      id: '52',
      category: 'GK',
      title: 'Who invented the telephone?',
      options: {
        'Alexander Graham Bell': true,
        'Thomas Edison': false,
        'Nikola Tesla': false,
        'Albert Einstein': false,
      },
    ),
    Question(
      id: '53',
      category: 'GK',
      title: 'What is the largest planet in our solar system?',
      options: {
        'Earth': false,
        'Mars': false,
        'Jupiter': true,
        'Saturn': false,
      },
    ),
    Question(
      id: '54',
      category: 'GK',
      title: 'Which is the smallest continent by land area?',
      options: {
        'Asia': false,
        'Africa': false,
        'Europe': false,
        'Australia': true,
      },
    ),
    Question(
      id: '55',
      category: 'GK',
      title: 'What is the chemical symbol for gold?',
      options: {
        'Au': true,
        'Ag': false,
        'Fe': false,
        'Hg': false,
      },
    ),
    Question(
      id: '56',
      category: 'GK',
      title: 'Who painted the Mona Lisa?',
      options: {
        'Vincent van Gogh': false,
        'Pablo Picasso': false,
        'Leonardo da Vinci': true,
        'Claude Monet': false,
      },
    ),
    Question(
      id: '57',
      category: 'GK',
      title: 'Who was the first woman to go into space?',
      options: {
        'Valentina Tereshkova': true,
        'Sally Ride': false,
        'Mae Jemison': false,
        'Eileen Collins': false,
      },
    ),
    Question(
      id: '58',
      category: 'GK',
      title: 'Which is the longest river in the world?',
      options: {
        'Amazon River': false,
        'Nile River': true,
        'Yangtze River': false,
        'Mississippi River': false,
      },
    ),
    Question(
      id: '59',
      category: 'GK',
      title: 'What is the largest mammal in the world?',
      options: {
        'Elephant': false,
        'Blue Whale': true,
        'Giraffe': false,
        'Great White Shark': false,
      },
    ),

  ];

  late List<Question> _questions;
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  @override
  void initState() {
    super.initState();
    _questions = _allQuestions.where((q) => q.category == widget.category).toList();
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Smartprep - ${widget.category}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF232A4D), Color(0xFF3B4A8B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _questions.isEmpty
              ? const Center(
                  child: Text(
                    'No questions for this category.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              color: const Color(0xFF232A4D),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 32, horizontal: 16),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Question ${index + 1} out of ${_questions.length}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Text(
                                      _questions[index].title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            for (int i = 0;
                                i < _questions[index].options.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 24.0),
                                child: GestureDetector(
                                  onTap: () => checkAnswerAndUpdate(
                                      _questions[index]
                                          .options
                                          .values
                                          .toList()[i]),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    color: isPressed
                                        ? _questions[index]
                                                    .options
                                                    .values
                                                    .toList()[i] ==
                                                true
                                            ? Colors.greenAccent
                                            : Colors.redAccent
                                        : Colors.white,
                                    elevation: 4,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      alignment: Alignment.center,
                                      child: Text(
                                        _questions[index]
                                            .options
                                            .keys
                                            .toList()[i],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF232A4D),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: NextButton(
                        nextQuestion: nextQuestion,
                      ),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
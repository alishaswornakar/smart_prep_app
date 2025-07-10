import 'package:http/http.dart' as http;  // the http package
import './question_model.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBconnect {
  // let's first create a function to add a question to our database.
  // declare the name of the tavle you want to create and add .json as suffix
  final url = Uri.parse(
    'https://smartprepquizapp-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async  {
    http.post(url, 
    body: json.encode({
      'title': question.title,
      'options': question.options,
      }));
  }

// fetch the data from database
Future<void> featchQuestions() async {
  // we got the data from just using this. now let's print it to see what we got.
  http.get(url).then((response) {
    // the 'then' method returns a 'response' which is our data.
    // to whats inside we have to decode it first
    var data = json.decode(response.body);
    print(data);
  });
 } 
} 
// to upload data in firebase
Future<void> uploadQuestionsToFirebase() async {
  for (final sector in data.entries) {
    uploadQuestionsForField(
      sector.key,
      sector.value,
    );
  }
}

Future<void> uploadQuestionsForField(String field, dynamic data) async {
  FirebaseFirestore.instance.collection('ListOfQuestions').doc(field).set(data);
}

final data = {
  "Flutter": {
    "title": "SmartPrep Quiz",
    "image_url": "https://itslink.com/wp-content/uploads/2020/03/flutter-app-featured.png",
    "questions": {
      "0": {
        "correctOptionKey": "A",
        "options": {"1": "number", "2": "int", "3": "String", "4": "bool"},
        "questionText": "Which of the following is NOT a valid Dart data type?"
      },
      "1": {
        "correctOptionKey": "A",
        "options": {
          "1": "Widget build(BuildContext context)",
          "2": "super.build()"
        },
        
      }
      
    }
  }
};

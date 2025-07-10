// import the material package
import 'package:SmartPrep/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:SmartPrep/models/question_model.dart';
import './screens/home_screen.dart'; 
import './screens/login_screen.dart';
import './screens/splash_screen.dart';
import './screens/signup_screen.dart';  //the file we just created.
import './models/db_connect.dart';
// run the main method
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var db = DBconnect();
  // db.addQuestion(Question(id: '20', title: 'What is 20 x 100 ?', options: {
  //  '100':false,
  // '200':true,
  //  '300':false,
  //  '500':false,
  // }));
  db.featchQuestions();
  // the runApp method
  runApp(
    const MyApp(),   //we will create this below
  );
}

  //create the MyApp widget
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // remove the debug banner
      debugShowCheckedModeBanner: false,
      // set a homepage
      // we will create this in a separate file.
      home: SplashScreen(),
    );
  }
}






class UploadDataInFirebase extends StatelessWidget {
  const UploadDataInFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              uploadQuestionsToFirebase(); // The method 'uploadQuestionsToFirebase' is likely not imported
            },
            child: const Text("Upload Data"),
          ),
        ),
      ),
    );
  }
}

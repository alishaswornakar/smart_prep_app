import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebase_firestore = FirebaseFirestore.instance;
  Future<String> signup({required String email, required String password, required String name}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String res = "some error occurred";
    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        res = "Please fill all fields";
      } else {
        // Your sign up logic here, for example:
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        
        // Add user data to Firestore
        await firebase_firestore.collection('users').doc(userCredential.user?.uid).set({
          'uid': userCredential.user?.uid,
          'email': email,
          'name': name,
        });
        res = "success";
       
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  // for login user
  Future<String> login({required String email, required String password}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String res = "some error occurred";
    try {
      if (email.isEmpty || password.isEmpty) {
        res = "Please fill all fields";
      } else {
        // Your login logic here, for example:
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
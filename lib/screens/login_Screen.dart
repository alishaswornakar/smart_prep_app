import 'package:SmartPrep/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:SmartPrep/screens/Login_Screen.dart';
import 'package:SmartPrep/service/auth_service.dart'; // Import the LoginScreen
import 'package:SmartPrep/screens/Signup_Screen.dart'; // Import the SignupScreen
import 'package:SmartPrep/screens/Home_Screen.dart'; // Import the HomeScreen
import 'package:SmartPrep/screens/nav_bar_category_screen.dart'; // Import the NavBarCategoryScreen
import 'package:firebase_auth/firebase_auth.dart';

// TODO: Replace this with your actual AuthService import if it exists elsewhere
class AuthService {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;
  bool isPasswordHidden = true;
final authService = AuthService();
// ...existing code...
void login() async {
  setState(() => isloading = true);
  try {
    await authService.login(emailController.text, passwordController.text);
    // Navigate to home screen on success
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NavBarCategoryScreen ()),
    );
  } catch (e) {
    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed: ${e.toString()}')),
    );
  }
  setState(() => isloading = false);
}
// ...existing code...

  @override
  Widget build(BuildContext context) {
  return Scaffold(
     resizeToAvoidBottomInset: true,
    backgroundColor: Colors.white,
	  body:SingleChildScrollView(child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/logo.png'),
           const SizedBox(height: 20),
           TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
           ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: isPasswordHidden, // Use the isPasswordHidden variable
              decoration: InputDecoration(
                labelText: 'password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility
                  ),
                  onPressed: () {
                    // Toggle password visibility
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                      // Logic to toggle visibility can be added here
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: MyButton(
                onTap: login, // Call the login function when the button is pressed
                color: Colors.blueAccent,
                buttontext: 'LOGIN',
              ),
            ),
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("don't have a account?",style: TextStyle(fontSize: 18),
            ),
            GestureDetector(

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
                // Navigate to the registration screen
                
              },
              child: const Text(
                ' SignUp here',
                style: TextStyle(fontSize: 18, color: Colors.blue, letterSpacing: -1),
              ),
            )
            ],)
          ],
        ),
      ),
    ),
  );
  
  }
}
// ...existing code...
// ...existing code...
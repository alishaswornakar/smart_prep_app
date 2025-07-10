import 'package:SmartPrep/service/auth_service.dart' as auth_service;
import 'package:SmartPrep/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:SmartPrep/screens/Login_Screen.dart'; // Import the LoginScreen

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;
  bool isPasswordHidden = true;
  final authservice = auth_service.AuthService();
  void signup() async {
    setState(() {
      isloading = true;
    });
    final res = await authservice.signup(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    if (res == "success") {
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("signup successful!, turn to login")),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("signup failed! ($res)")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/logo.png'),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
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
                obscureText: isPasswordHidden,
                decoration: InputDecoration(
                  labelText: 'password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility),
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
              isloading
                  ? const Center(child: CircularProgressIndicator())
                  
              :SizedBox(
                width: double.infinity,
                child: MyButton(
                  buttontext: 'SIGN UP',
                  color: Colors.blueAccent,
                  onTap: signup,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have an account?",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      ' login here',
                      style: TextStyle(
                          fontSize: 18, color: Colors.blue, letterSpacing: -1),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
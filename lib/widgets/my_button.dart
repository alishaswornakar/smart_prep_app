import 'package:flutter/material.dart';
import 'package:SmartPrep/screens/Login_Screen.dart'; // Import the LoginScreen

class MyButton extends StatelessWidget{
  final VoidCallback onTap;
  final String buttontext;
  final Color? color;
  
   MyButton({
    super.key,
    required this.onTap,
    required this.buttontext,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: color,
      ),
      onPressed: onTap,
      child: Text(
        buttontext,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
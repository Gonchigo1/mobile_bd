import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bd1/components/my_textfield.dart';
import 'package:bd1/components/square_tile.dart';
import 'package:bd1/services/firebase_auth_methods.dart';
// import 'package:mysql_client/mysql_client.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CustomButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
        backgroundColor: Colors.grey,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}

class Burtguul extends StatelessWidget {
  final TextEditingController nerController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  FirebaseAuthMethods firebaseAuthMethods =
      FirebaseAuthMethods(FirebaseAuth.instance);

  void signUpUser(BuildContext context) async {
    firebaseAuthMethods.signUpMethod(
      email: emailController.text,
      password: passwordController1.text,
      context: context,
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'assets/image.jpg'),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Бүртгүүлэх',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: nerController,
                  hintText: 'Нэр',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'И-мэйл хаяг',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController1,
                  hintText: 'Нууц үг',
                  obscureText: true,
                ),
               const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      signUpUser(context);
                    },
                    text: 'Бүртгүүлэх',
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

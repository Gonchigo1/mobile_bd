import 'package:bd1/components/my_button.dart';
import 'package:bd1/components/my_textfield.dart';
import 'package:bd1/components/square_tile.dart';
import 'package:bd1/home.dart';
import 'package:bd1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Burtguul extends StatelessWidget {
  Burtguul({super.key});


  List<String> options  = ['option1','option2'];

  final usernameController = TextEditingController();
  final nerController = TextEditingController();
  final owogController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final emailController = TextEditingController();


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [


              const SizedBox(height: 20),
              // logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/image.jpg'),
                ],
              ),

              // Бүртгүүлэх
              const SizedBox(height: 20),
              Text(
                'Бүртгүүлэх',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                ),
              ),


              // Owog
              const SizedBox(height: 10),
              MyTextField(
                controller: nerController,
                hintText: 'Овог',
                obscureText: false,
              ),


              // Ner
              const SizedBox(height: 10),
              MyTextField(
                controller: owogController,
                hintText: 'Нэр',
                obscureText: false,
              ),


              // Utasnii dugaar
              const SizedBox(height: 10),
              MyTextField(
                controller: usernameController,
                hintText: 'Утасны дугаар',
                obscureText: false, // bichsen text haragdah eseh
              ),


              // Email
              const SizedBox(height: 10),
              MyTextField(
                controller: emailController,
                hintText: 'И-мэйл хаяг',
                obscureText: false,
              ),


              // Nuuts ug
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController1,
                hintText: 'Нууц үг',
                obscureText: true,
              ),


              // Nuuts ug dawtan oruulah
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController2,
                hintText: 'Нууц үг давтан оруулна уу!',
                obscureText: true, // bichsen textiig nuuh
              ),


            // Burtguuleh towch
            SizedBox(height: 15.0),
              ElevatedButton(
                  onPressed: () {
                  FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: emailController.text, 
                      password: passwordController1.text)
                    .then((value) {
                      print ("Created New Account");
                      Navigator.push(context,
                         MaterialPageRoute(builder: (context) => LoginApp()));
                    }).onError((error, stackTrace) {
                      print ("Алдаа ${error.toString()}");
                    });
                },

              style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: 120, 
                  vertical: 10),
                backgroundColor: Colors.grey,
                ),
              child: Text( 'Бүртгүүлэх',
              style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}

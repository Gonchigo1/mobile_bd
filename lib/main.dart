import 'package:bd1/home.dart';
import 'package:bd1/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC4rgwulXKWuNxgsc4uRu2NzbPXMGM4aaM", 
      appId: "1:198194098882:android:eee328484278642c84815b", 
      messagingSenderId: "198194098882", 
      projectId: "mobile-bd-56e8e",
      ),
  );
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Нэвтрэх',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _ovogController = TextEditingController();
  // final TextEditingController _nerController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;
    print('Phone: $email');
    print('Password: $password');
  }

  void _forgotPassword() {
    print('Нууц үг мартсан?');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/image.jpg'),
              ),

            Text(
              "Нэвтрэх",
              style: TextStyle(fontSize: 30),
            ),

            
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'И-мейл хаяг',
                border: OutlineInputBorder(),
              ),
            ),


            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Нууц үг',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),


            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                child: Text('Нууц үг мартсан?'),
              ),
            ),


            // Newtreh towch
            SizedBox(height: 20.0),
            
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: _emailController.text, 
                      password: _passwordController.text)
                    .then((value) {
                      print("test001");

                      print(value);
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
              }).onError((error, stackTrace) {
                      print ("Алдаа ${error.toString()}");
                    });
                },

              style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
              backgroundColor: Colors.grey,
                ),
              child: Text( 'Нэвтрэх',
              style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                ),
              
            SizedBox(height: 15.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => Burtguul()),
                );
              },
              child: Text("Бүртгүүлэх",
              style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

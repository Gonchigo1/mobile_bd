import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bd1/services/firebase_auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bd1/firebase_options.dart';
import 'package:bd1/home.dart';
import 'package:bd1/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
            create: (_) => FirebaseAuthMethods(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) =>
              context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Нэвтрэх',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
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
  FirebaseAuthMethods firebaseAuthMethods =
      FirebaseAuthMethods(FirebaseAuth.instance);

  void loginWithEmail(BuildContext context) async {
    firebaseAuthMethods.loginWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
  }

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
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding:
            const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/image.jpg'),
            ),
            const Text(
              "Нэвтрэх",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'И-мейл хаяг',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Нууц үг',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                child: const Text('Нууц үг мартсан?'),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                loginWithEmail(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 120, vertical: 10),
                backgroundColor: Color.fromARGB(255, 0, 13, 255),
              ),
              child: const Text(
                'Нэвтрэх',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Burtguul()),
                );
              },
              child: const Text(
                "Бүртгүүлэх",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthStateChanges extends StatefulWidget {
  const AuthStateChanges({Key? key}) : super(key: key);

  @override
  State<AuthStateChanges> createState() => _AuthStateChangesState();
}

class _AuthStateChangesState extends State<AuthStateChanges> {
  @override
  Widget build(BuildContext context) {
    final firebaseCurrentUser = context.watch<User?>();
    if (firebaseCurrentUser != null) {
      return HomePage();
    } else {
      return LoginApp(); 
     }
  }
}
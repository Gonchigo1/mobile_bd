import 'package:bd1/constraints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods{
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user =>_auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();


  Future<void> signUpMethod({
     required String email, 
     required String password,
     required BuildContext context,
  }) 
  async {

    try {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch (e) {
      if(e.code=="weak-password"){
        print("the password is too weak");
      }
      else if (e.code=="email-already-in-use"){
        print("the account already exists");
      } showSnackBar(context, e.message!);

  
    }
  }

  Future<void> loginWithEmail({
     required String email, 
     required String password,
     required BuildContext context,
  }) 
  async {

    try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      
      showSnackBar(context, e.message!);

    }
  }
}

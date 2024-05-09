import 'package:bd1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ProfilePage extends StatefulWidget {

  @override 
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>  {
  @override
  Widget build(BuildContext context) {
     @override
      void initState()
      { 
        super.initState();
        print('profile pagee starting');
        _getDocumentFromFirestore();
      } 
 
    return Scaffold( 
     appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        title: Transform(
          // you can forcefully translate values left side using Transform
          transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
          child: Text(
            "Хэрэглэгчийн мэдээлэл",
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      body: Center(
        
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'profile page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                Text('Гарах'),

            IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
Future<void> _getDocumentFromFirestore() async {
  try {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the document reference
    DocumentSnapshot documentSnapshot =
        await firestore.collection('01').doc('user').get();

    // Check if the document exists
    if (documentSnapshot.exists) {
      // Access document data
      Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        // Do something with the document data
        print('Document data: $data');
      } else {
        print('Document data is null');
      }
    } else {
      print('Document does not exist');
    }
  } catch (error) {
    print('Error retrieving document: $error');
  }
}
}

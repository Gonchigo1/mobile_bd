import 'package:bd1/basket.dart';
import 'package:bd1/home.dart';
import 'package:bd1/profile.dart';
import 'package:bd1/selbeg.dart';
import 'package:flutter/material.dart';

class zarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Таны зар"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'zar page',
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
           IconButton(
  icon: Icon(Icons.home),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  },
),

            
            IconButton(
              icon: Icon(Icons.directions_car), 

              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => selbegPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.task), 
                            color: Colors.blue,

              onPressed: () {
              },
              
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => basketPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:bd1/home.dart';
import 'package:bd1/profile.dart';
import 'package:bd1/selbeg.dart';
import 'package:bd1/zar.dart';
import 'package:flutter/material.dart';

class basketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Таны сагс"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Таны сагс хоосон байна',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
              Image.asset('assets/emptybox.jpeg'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           IconButton(
  icon: const Icon(Icons.home),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  },
),
 IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => selbegPage()),
                );
              },
            ),

            IconButton(
              icon:const Icon(Icons.local_offer),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ZarPage()),
                );
              },
              
            ),
            
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              iconSize: 40,
                            color: Colors.blue,
              onPressed: () {
              },
              
            ),

            IconButton(
              icon: const Icon(Icons.account_box),
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

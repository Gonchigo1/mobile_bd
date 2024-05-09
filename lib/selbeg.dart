import 'package:bd1/basket.dart';
import 'package:bd1/book_car.dart';
import 'package:bd1/car_widget.dart';
import 'package:bd1/data.dart';
import 'package:bd1/home.dart';
import 'package:bd1/profile.dart';
import 'package:bd1/zar.dart';
import 'package:flutter/material.dart';

class selbegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Сэлбэгийн жагсаалт",
        style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Сэлбэг хайх",
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const  BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:const  EdgeInsets.only(left: 30),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 24, left: 16),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  )
                ),
              ),
            ),
          ),


          Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(24.0),
                  physics: const BouncingScrollPhysics(),
                  // childAspectRatio: 1/1.25,
                  childAspectRatio: 100 / 140,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 30,
                  
                  children: getCarList().map((item){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookCar(car: item)),
                        );
                      },
                      child: buildCar(item, 16)
                      );
                  }).toList(),
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
        icon:const Icon(Icons.home),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
      IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 40,
              color: Colors.blue,

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

              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => basketPage()),
                );
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

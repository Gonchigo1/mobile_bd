import 'package:bd1/available_cars.dart';
import 'package:bd1/book_car.dart';
import 'package:bd1/car_widget.dart';
import 'package:bd1/data.dart';
import 'package:flutter/material.dart';
import 'package:bd1/basket.dart';
import 'package:bd1/profile.dart';
import 'package:bd1/selbeg.dart';
import 'package:bd1/zar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
class HomePage extends StatefulWidget {

  @override 
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage>
{

  List<Car> cars = getCarList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        elevation: 10,
        leading: Container(
          padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
          child: Image.asset('assets/profile.png'),
        ),
        title: Transform(
          transform: Matrix4.translationValues(15.0, 0.0, 0.0),
          child: Text(
            "Сайн байна уу?\n   Дуламсүрэн",
            style: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Perform search action here
              },
            ),
          ),
        ],
      ),

      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Автомашин хайх",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Хайх",
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.only(left: 30),
                  suffixIcon: Padding(
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only (
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30) ,
                  ),
              ),
              child: Column(
                children: [
                  
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text(
                          "Үнэлгээний зар",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          )  ,                        
                        ),


                        GestureDetector(
                          onTap: () {
                          Navigator.push (
                            context,
                            MaterialPageRoute(builder: (context) => AvailableCars())
                          );
                        },


                        child: Row(
                            children: [
                              Text(
                                'бүгдийг үзэх',
                              style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ) ,
                            ),

                        SizedBox(width: 8),

                        Icon(
                          Icons.arrow_forward_ios,
                          size:12,
                          color: Colors.blue,
                        ),
                    
                        ],
                        ),
                        ),

                      ],
                    ),

                  ),

                Container(
                  height: 280,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: buildDeals(),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                  print('asdd');
                  User? user = auth.currentUser;
                  String userId = user!.uid;
                  DocumentSnapshot userData = await firestore.collection('users').doc(userId).get();
                  if (userData.exists) {
                      // User data found
                      var data = userData.data();
                      print("user data ::: " + data.toString());
                      // Do something with data
                    } else {
                      // User data not found
                    }
                    return;
                    Navigator.push (
                      context,
                      MaterialPageRoute(builder: (context) => AvailableCars())
                    );
                  },


                child: Padding(
                    padding:  EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                  
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                  
                                Text(
                                  "Авто машинаа үнэлүүлэх",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                 ],
                            ),
                  
                                Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    )
                                  ),
                               
                        ],
                  
                      ),
                    ),
                  ),
                ),

                ],
              ),

            ),
          )
          
        )
        
        ],
      ),
      
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              
              ],
            ),
            IconButton(
              icon: Icon(Icons.directions_car),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => selbegPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.task),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => zarPage()),
                );
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

    List<Widget> buildDeals(){
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: cars[i])),
            );
          },
          child: buildCar(cars[i], i)
        )
      );
    }
    return list;
  }
}

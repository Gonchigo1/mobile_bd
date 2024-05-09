import 'package:flutter/material.dart';
import 'package:bd1/available_cars.dart';
import 'package:bd1/book_car.dart';
import 'package:bd1/car_widget.dart';
import 'package:bd1/data.dart';
import 'package:bd1/unelgee.dart';
import 'package:bd1/basket.dart';
import 'package:bd1/profile.dart';
import 'package:bd1/selbeg.dart';
import 'package:bd1/zar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  List<Car> cars = getCarList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        elevation: 10,
        leading: Container(
          padding: const EdgeInsets.only(left: 20, top: 3, bottom: 3),
          child: Image.asset('assets/profile.png'),
        ),
        title: Transform(
          transform: Matrix4.translationValues(15.0, 0.0, 0.0),
          child: const Text(
            "Сайн байна уу?\n   Гончигдорж",
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
              icon: const Icon(Icons.search),
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
          const SizedBox(height: 5,),
          const Padding(
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
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Хайх",
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.only(left: 30),
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 159, 159, 159),
                  borderRadius: const BorderRadius.only (
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30) ,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Text(
                            "Үнэлгээний зар",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AvailableCars())
                              );
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'бүгдийг үзэх',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
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
                          color: Color.fromARGB(255, 255, 0, 0),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...buildDeals(),
                              Container(
                                width: 200,
                                child: Image.asset('assets/images/Mpackage1.jpg'),
                              ),
                            ],
                          ),
),


                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 37, 8, 255),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                      height: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UnelgeePage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          const  Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Авто машинаа үнэлүүлэх",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ],
                            ),
                           Container(
                              child:const Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                  iconSize: 40, 
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
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
              icon: const Icon(Icons.local_offer),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => basketPage()),
                );
              },
            ),
            Column(
            children: [
              IconButton(
                icon: const Icon(Icons.account_box),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              Text(
                'Profile',
                style: TextStyle(fontSize: 12),
                ),
             ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildDeals() {
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
          child: buildCar(cars[i], i),
        ),
      );
    }
    return list;
  }
}

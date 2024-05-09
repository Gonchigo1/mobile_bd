import 'package:bd1/data.dart';
import 'package:flutter/material.dart';


class BookCar extends StatefulWidget{

  final Car car;

  BookCar({required this.car}); 
  
  @override 
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State <BookCar>{

  int _currentImage = 0;

  List <Widget> buildPageIndicator(){
    List <Widget> list = [];
    for (var i=0; i<widget.car.images.length; i++){
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator (bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration( 
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all( 
          Radius.circular(12),
        ),
      ),
    );
  }


  @override 
  Widget build (BuildContext context){
    return Scaffold (
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all (
                                    color: const Color.fromARGB(255, 224, 224, 224),
                                    width: 1,
                                  ),
                                ),
                                child: Icon (
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                            ),

                            Row(
                              children: [

                                Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Icon (
                                  Icons.bookmark_border,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),

                              ],
                            ),

                          ],
                        ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.model,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),


                        SizedBox(
                          height: 8,
                        ),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.brand,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          ),



                        // Zurag
                        SizedBox(
                          height: 8,
                        ),

                        Expanded(
                          child: Container(
                            child: PageView(
                              physics: BouncingScrollPhysics(),
                              onPageChanged: (int page){
                                setState(() {
                                  _currentImage = page;
                                });
                              },
                              children: widget.car.images.map((path){
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Image.asset(
                                    path,
                                    fit: BoxFit.scaleDown,
                                  ),
                                );
                              }).toList(),
                              ),
                            ),
                          ),

                    widget.car.images.length > 1 
                    ? Container (
                      margin: EdgeInsets.symmetric(vertical: 16,),
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildPageIndicator(),
                      ),
                    )
                    : Container (),
                    ],
                  ),
                )),

              // Mashinii medeelel
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only( 
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                 ),
                 child: Column ( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16 ),
                      child: Text(
                        "Машины мэдээлэл",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),

                    Container(
                      height: 80,
                      padding: EdgeInsets.only(top: 8, left: 16,),
                      margin: EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCar("Үйлдвэрлэгч", "BMW"),
                          buildSpecificationCar("Нэр", "M package"),
                          buildSpecificationCar("Төрөл", "Суудлын"),
                          buildSpecificationCar("Өнгө", "Цагаан"),
                          buildSpecificationCar("Үйлдвэрлэсэн он", "2017"),
                        ],
                      ),
                    ),

                  ],
                 ),
              ),
            ],
          ),
          ),
        ),
        
        //Uniin medeelel
        bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "2 хоногийн өмнө",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                SizedBox(
                  height: 4,
                ),

                Row(
                  children: [

                    Text(
                      "4.500.000₮",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                  ],
                ),

              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Үнэлэгдсэн",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  // Mashinii medeelliin punkts
  Widget buildSpecificationCar(String title, String data){
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}
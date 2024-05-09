import 'dart:js_interop';

import 'package:bd1/data.dart';
import 'package:flutter/material.dart';

Widget buildCar(Car car, int index){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(right: index != null ? 16:0, left: index == 0 ? 16:0) ,
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.condition,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

      SizedBox(
        height: 8 ,
        ),

      Container(
        height: 120,
        child: Center(
          child: Image.asset(
            car.images[0],
            fit: BoxFit.fitWidth,
          ),
        ),
      ),

      SizedBox(
        height: 20 ,
        ),

      Text(
        car.brand,
        style: TextStyle(fontSize: 18)
      ),


      SizedBox(
        height: 8 ,
        ),

      Text(
        car.model,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),

      Text(
        (car.condition == "Daily" ? "Өдрийн" : car.condition == "Weekly" ? "Долоо хоногийн" : "Сарын") + " өмнө",
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey,
        ),
      ),

      ],
    ),
  );
}
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final Function()? onTap;

  const MyButton ({super.key, required this.onTap});

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),//ugnii button dotorh zai
          margin: const EdgeInsets.symmetric(horizontal: 25), //delgetsnii 2 talaas awah zai
          decoration: BoxDecoration( // button uusne
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              "Бүртгүүлэх",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
      ),
    );
  }
}
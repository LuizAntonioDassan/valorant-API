import 'package:flutter/material.dart';

Widget subtitleStyle(String Name){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(Name, style:
      const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 30,
        letterSpacing: 2,
      ),
    textAlign: TextAlign.center,
    ),
  );
}
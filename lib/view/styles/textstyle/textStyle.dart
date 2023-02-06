import 'package:flutter/material.dart';

Widget subtitleStyle(String Name){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(Name, style:
      const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 30,
        letterSpacing: 2,
      ),
        textAlign: TextAlign.center,
      ),
    );
}

Widget contentTextStyle(String content){
  return Text(content, style: const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 1
  ),
    textAlign: TextAlign.center,
  );
}

Widget contentAlertTextStyle(String content){
  return Text(content,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      letterSpacing: 1
    ),
    textAlign: TextAlign.center,
  );
}

Widget titleAlertTextStyle(String content){
  return Text(content,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 30,
      letterSpacing: 1
    ),
    textAlign: TextAlign.center,
  );
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant/model/provider/provider.dart';
import 'view/homepage.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => FavoriteProvider(),
    child: MaterialApp(
      home: homePage(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}


//Riot Key RGAPI-4e25cc28-299d-459d-acf7-67000747fd86
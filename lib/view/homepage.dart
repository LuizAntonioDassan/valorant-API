import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/view/lists/mapList.dart';
import 'package:valorant/view/pages/agentPage.dart';
import 'package:valorant/view/lists/listAgent.dart';
import 'package:valorant/view/lists/weaponsList.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Valorant Agentes"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.star),),
              Tab(icon: Icon(Icons.chair),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: listAgent(),),
            Center(child: weaponsList(),),
            Center(child: mapList(),),
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      listAgent;
    });
  }

  // Future<dataAgent?> _toAgent() async {
  //   dataAgent agent = dataAgent.fromJson(_getData() as Map<String, dynamic>);
  //   return null;
  // }
}



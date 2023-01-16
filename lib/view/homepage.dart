import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/view/agentPage.dart';
import 'package:valorant/view/listAgent.dart';
import 'package:valorant/view/weaponsList.dart';

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
              Tab(icon: Icon(Icons.wifi),)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: listAgent(),),
            Center(child: weaponsList(),),
            Center(child: Text('Tab 3'),),
            Center(child: Text('Tab 4'),),
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



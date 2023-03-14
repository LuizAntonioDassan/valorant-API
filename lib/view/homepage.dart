

import 'package:flutter/material.dart';
import 'package:valorant/view/lists/mapList.dart';
import 'package:valorant/view/lists/listAgent.dart';
import 'package:valorant/view/lists/weaponsList.dart';
import 'package:valorant/view/pages/favoritePages.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Valorant Agentes"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.star),),
              Tab(icon: Icon(Icons.chair),),
            ],
          ),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover
            )
          ),
          child: const TabBarView(
            children: [
              Center(child: listAgent(),),
              Center(child: weaponsList(),),
              Center(child: mapList(),),
            ],
          ),
        ),
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



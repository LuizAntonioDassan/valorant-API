import 'dart:math';

import 'package:flutter/material.dart';

class agentPage extends StatelessWidget {
  Map<String, dynamic> agent;
  final List<int> list = [0,1,2,3];

  agentPage({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(agent['displayName'], style: TextStyle(
          fontSize: 30,
        ),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Image.network(agent['fullPortrait']),
              SizedBox(height: 20,),
              Text(agent['description'],style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 20,),
              Divider(thickness: 4,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roleColor(),
                    SizedBox(width: 12,),
                    Text(agent['role']['displayName'], style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text(agent['role']['description'],style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              Divider(thickness: 4,),
              Container(
                child: Column(
                  children: [
                    for(var i in list)
                      abilities(i),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget roleColor(){
    if(agent['role']['displayName'] == "Initiator")
      return Image.network(agent['role']['displayIcon'],color: Colors.blue, height: 60,);
    if(agent['role']['displayName'] == "Sentinel")
      return Image.network(agent['role']['displayIcon'],color: Colors.yellow, height: 60,);
    if(agent['role']['displayName'] == "Duelist")
      return Image.network(agent['role']['displayIcon'],color: Colors.red, height: 60,);
    if(agent['role']['displayName'] == "Controller")
      return Image.network(agent['role']['displayIcon'],color: Colors.purple, height: 60,);
    else{
      return Container();
    }
  }
  /*
  * Row(
                children: [
                  Column(
                    children: [
                      Image.network(agent['abilities'][0]['displayIcon'], height: 60, color: Colors.green,),
                      Text(agent['abilities'][0]['displayName'],style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  Expanded(child: Text(agent['abilities'][0]['description'],))
                ],
                * )
  *  */

  Widget abilities(int i){
    print(agent['abilities']);

    if(agent['abilities'][i] != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(agent['abilities'][i]['displayIcon'],
                  width: 80,
                  color: Colors.green,),
                Text(agent['abilities'][i]['displayName'],
                  style: TextStyle(fontSize: 16),),
              ],
            ),
            VerticalDivider(thickness: 2,),
            Expanded(child: Text(agent['abilities'][i]['description'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),))
          ],
        ),
      );
    }
    else{
      return Container();
    }
    return Container();
  }
}

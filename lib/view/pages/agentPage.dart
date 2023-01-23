import 'package:flutter/material.dart';

class agentPage extends StatelessWidget {
  final Map<String, dynamic> agent;
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
              Text("Tap to see", style: TextStyle(fontWeight: FontWeight.w800),),
              Row(
                children: [
                  ...list.map((e) => abilities(e, context)).toList()
                ],
              )
              // .map para pegar cada item da lista / (e) para referenciar o indice do item
              // "..." pega cada item de uma lista e coloca em outra.


              // Container(
              //   child: Column(
              //     children: [
              //       for(var i in list)
              //         abilities(i),
              //     ],
              //   ),
              // )

            ],
          ),
        ),
      ),
    );
  }

  Widget roleColor(){
    if(agent['role']['displayName'] == "Initiator") {
      return Image.network(agent['role']['displayIcon'],color: Colors.blue, height: 60,);
    }
    if(agent['role']['displayName'] == "Sentinel") {
      return Image.network(agent['role']['displayIcon'],color: Colors.yellow, height: 60,);
    }
    if(agent['role']['displayName'] == "Duelist") {
      return Image.network(agent['role']['displayIcon'],color: Colors.red, height: 60,);
    }
    if(agent['role']['displayName'] == "Controller") {
      return Image.network(agent['role']['displayIcon'],color: Colors.purple, height: 60,);
    } else{
      return Container();
    }
  }

  Widget abilities(int i, BuildContext context){
    if(agent['abilities'][i] != null){
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(agent['abilities'][i]['displayName']),
                          content: Text(agent['abilities'][i]['description'],
                            style: TextStyle(fontSize: 20),),
                        );
                      });
                },
                child:  Image.network(agent['abilities'][i]['displayIcon'],
                  width: 80, fit: BoxFit.contain,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 4,),
              Text(agent['abilities'][i]['displayName'],
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      );
    }
    else{
      return Container();
    }
  }

}

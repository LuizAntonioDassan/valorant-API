import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valorant/model/api.dart';
import 'package:valorant/view/agentPage.dart';
import 'package:http/http.dart' as http;


class listAgent extends StatefulWidget {
  const listAgent({Key? key}) : super(key: key);

  @override
  State<listAgent> createState() => _listAgentState();
}

class _listAgentState extends State<listAgent> with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: _getData(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Erro"),
            );
          }

          if(snapshot.hasData){
            return ListView.builder(
                itemCount: 21,
                itemBuilder: (context, index){
                  if(snapshot.data!['data'][index]['isPlayableCharacter'] == true){
                    var name = snapshot.data!['data'][index]['displayName'];
                    var icon = snapshot.data!['data'][index]['displayIcon'];
                    var agent = snapshot.data!['data'][index];
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => agentPage(agent: agent)));
                      },
                      subtitle: Text(name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,),
                      //função Image.network para transformar uma String em Image;
                      title: Image.network(icon,height: 200,),
                      onLongPress: _preview,
                    );
                  }else{
                    return Container();
                  }
                });
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    void _preview(){

    }
    Future<Map> _getData() async {
      http.Response response = await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
      //get retorna um tipo Response
      var json = jsonDecode(response.body);
      //usa a função JsonDecode para converter no tipo Map para usar no Dart
      //var agents = valorantAgents.fromMap(json);
      return json;

      //print(response.body);
  }
}

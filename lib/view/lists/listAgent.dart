import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valorant/view/pages/agentPage.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/view/styles/textstyle/textStyle.dart';



class listAgent extends StatefulWidget {
  const listAgent({Key? key}) : super(key: key);

  @override
  State<listAgent> createState() => _listAgentState();
}

class _listAgentState extends State<listAgent> with SingleTickerProviderStateMixin {

  Color verde = const Color(0xff008000);

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
            List<dynamic> numAgents = snapshot.data!['data'];
            return ListView.builder(
                itemCount: numAgents.length,
                itemBuilder: (context, index){
                  if(snapshot.data!['data'][index]['isPlayableCharacter'] == true){
                    var name = snapshot.data!['data'][index]['displayName'];
                    var icon = snapshot.data!['data'][index]['displayIcon'];
                    var agent = snapshot.data!['data'][index];
                    return ListTile(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => agentPage(agent: agent)));
                      },
                      subtitle: subtitleStyle(name),
                      //função Image.network para transformar uma String em Image;
                      title: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        child: Image.network(icon,height: 250, fit: BoxFit.cover,),
                      ),
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
    Widget _preview(){
      return AlertDialog(
        title: Text("teste"),
      );
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


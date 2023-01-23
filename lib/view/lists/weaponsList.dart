import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/view/pages/weaponPage.dart';
import 'package:valorant/view/styles/textstyle/textStyle.dart';

class weaponsList extends StatefulWidget {
  const weaponsList({Key? key}) : super(key: key);

  @override
  State<weaponsList> createState() => _weaponsListState();
}

class _weaponsListState extends State<weaponsList> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Error"),
            );
          }
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: 18,
                itemBuilder: (context, index){
                  var icon = snapshot.data!['data'][index]["displayIcon"];
                  var name = snapshot.data!['data'][index]["displayName"];
                  var weapon = snapshot.data!['data'][index];
                  return ListTile(
                    title: Image.network(icon, height: 200,),
                    subtitle: subtitleStyle(name),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => weaponPage(weapon: weapon)));
                    },
                  );
                }
            );
          }
          else{
            return CircularProgressIndicator();
          }
        });
  }

  Future<Map> _getData() async {
    http.Response response = await http.get(Uri.parse("https://valorant-api.com/v1/weapons"));
    //get retorna um tipo Response
    var json = jsonDecode(response.body);
    //usa a função JsonDecode para converter no tipo Map para usar no Dart
    //var agents = valorantAgents.fromMap(json);
    return json;

    //print(response.body);
  }
}

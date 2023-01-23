import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/view/styles/textstyle/textStyle.dart';

class mapList extends StatefulWidget {
  const mapList({Key? key}) : super(key: key);

  @override
  State<mapList> createState() => _mapListState();
}

class _mapListState extends State<mapList> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot){
        List<dynamic> mapLenght = snapshot.data!['data'];
        if(snapshot.hasError){
          return Center(
            child: Text("Erro"),
          );
        }

        if(snapshot.hasData){
          return ListView.builder(
              itemCount: mapLenght.length,
              itemBuilder: (context, index){
                var icon = snapshot.data!['data'][index]['splash'];
                var name = snapshot.data!['data'][index]['displayName'];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                      title: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        child: Image.network(icon, width: 200, fit: BoxFit.cover,),
                      ),
                      subtitle: subtitleStyle(name),
                    ),
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
    http.Response response = await http.get(Uri.parse("https://valorant-api.com/v1/maps"));
    var json = jsonDecode(response.body);
    return json;
  }
}

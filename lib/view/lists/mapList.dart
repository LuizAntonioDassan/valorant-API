import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/view/styles/textstyle/textStyle.dart';
import 'package:valorant/model/api/api.dart';

class mapList extends StatefulWidget {
  const mapList({Key? key}) : super(key: key);

  @override
  State<mapList> createState() => _mapListState();
}

class _mapListState extends State<mapList> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMap(),
      builder: (context, snapshot){

        if(snapshot.hasError){
          return Center(
            child: Text("Erro"),
          );
        }

        if(snapshot.hasData){
          List<dynamic> mapLenght = snapshot.data!['data'];
          return ListView.builder(
              itemCount: mapLenght.length,
              itemBuilder: (context, index){
                print(index);
                var icon = snapshot.data!['data'][index]['splash'];
                var name = snapshot.data!['data'][index]['displayName'];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                      title: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        child: Image(
                          image: CachedNetworkImageProvider(
                            icon,
                            maxWidth: 360,
                            maxHeight: 360,
                          ),
                        )
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

  Future<Map> _getMap() async {
    final value = await Api.getData("https://valorant-api.com/v1/maps");
    return value;
  }
}

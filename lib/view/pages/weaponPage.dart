import 'package:flutter/material.dart';

import '../styles/textstyle/textStyle.dart';

class weaponPage extends StatelessWidget {
  Map<String, dynamic> weapon;

  weaponPage({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> skins = weapon['skins'];

    return Scaffold(
      appBar: AppBar(
        title: Text(weapon['displayName'], style: TextStyle(
          fontSize: 30,
        ),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: skins.length,
          itemBuilder: (context, index){
            var name = weapon!['skins'][index]['displayName'];
            var icon = weapon!['skins'][index]['displayIcon'];
            var contentTier = weapon!['skins'][index]['contentTierUuid'];
            if(icon != null){
              if(contentTier != null){
                return ListTile(
                  subtitle: subtitleStyle(name),
                  title: Image.network(icon, height: 200,),
                );
              }
              else{
                return Container();
              }
            }
            else{
              return Container();
            }
          }
      ),
    );
  }
}

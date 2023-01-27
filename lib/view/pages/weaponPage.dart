import 'package:flutter/material.dart';

import '../styles/textstyle/textStyle.dart';

class weaponPage extends StatelessWidget {
  final Map<String, dynamic> weapon;

  const weaponPage({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> skins = weapon['skins'];

    return Scaffold(
      appBar: AppBar(
        title: Text(weapon['displayName'], style: TextStyle(
          fontSize: 30,
        ),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover
          )
        ),
        child: ListView.builder(
            itemCount: skins.length,
            itemBuilder: (context, index){
              var name = weapon['skins'][index]['displayName'];
              var icon = weapon['skins'][index]['displayIcon'];
              var contentTier = weapon['skins'][index]['contentTierUuid'];
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
      ),
    );
  }
}

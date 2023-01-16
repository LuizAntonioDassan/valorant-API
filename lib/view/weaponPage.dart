import 'package:flutter/material.dart';

class weaponPage extends StatelessWidget {
  Map<String, dynamic> weapon;

  weaponPage({Key? key, required this.weapon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index){
          var name = weapon!['skins'][index]['displayName'];
          var icon = weapon!['skins'][index]['displayIcon'];
          return ListTile(
            subtitle: Text("Luiz"),
          );
        }
    );
  }
}

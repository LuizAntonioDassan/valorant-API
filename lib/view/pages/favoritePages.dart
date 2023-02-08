import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant/model/provider/provider.dart';

import '../styles/textstyle/textStyle.dart';
class favoritePage extends StatelessWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final skins = provider.skins;
    final skinsName = provider.skinsName;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover)),
        child: ListView.builder(
            itemCount: skins.length,
            itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 16),
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: (){
                                provider.toggleFavorite(skins[index],skinsName[index]);
                              },
                              icon: provider.ifExist(skins[index])
                                  ? Icon(Icons.favorite, color: Colors.red,)
                                  : Icon(Icons.favorite_border, color: Colors.red,),
                            )
                        ),
                        Image.network(
                          skins[index],
                          height: 200,
                        ),
                        Container(
                          child: Center(
                            child: subtitleStyle(skinsName[index]),
                          ),
                        )
                      ],
                    ),
                  );
            }),
      ),
    );;
  }
}

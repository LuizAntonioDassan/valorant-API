import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{
  List<String> _skins = [];
  List<String> _skinsName = [];
  List<String> get skins => _skins;
  List<String> get skinsName => _skinsName;


  void toggleFavorite(String skin, String name){
    final ifExist = _skins.contains(skin);
    if (ifExist){
      _skins.remove(skin);
      _skinsName.remove(name);
      print("Saiu");
      print(skin);
    }
    else{
      _skins.add(skin);
      _skinsName.add(name);
      print("Entrou");
      print(skin);
    }
    notifyListeners();
  }

  bool ifExist(String skin){
    final ifExist = _skins.contains(skin);
    return ifExist;
    notifyListeners();
  }

  void clearList(){
    _skins = [];
    notifyListeners();
  }

}
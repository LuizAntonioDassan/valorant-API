import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{
  List<Map> _skins = [];
  List<Map> get skins => _skins;

  void toggleFavorite(Map<dynamic, dynamic> skin){
    final ifExist = _skins.contains(skin);
    if (ifExist){
      _skins.remove(skin);
    }
    else{
      _skins.add(skin);
    }
  }

  void clearList(){
    _skins = [];
    notifyListeners();
  }

}
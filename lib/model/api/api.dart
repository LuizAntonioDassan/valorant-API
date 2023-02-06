import 'dart:convert';
import 'package:http/http.dart' as http;

class Api{
  static Future<Map> getData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    //get retorna um tipo Response
    var json = jsonDecode(response.body);
    //usa a função JsonDecode para converter no tipo Map para usar no Dart
    //var agents = valorantAgents.fromMap(json);
    return json;    //print(response.body);
  }


}
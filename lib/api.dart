import 'dart:convert';
import 'package:http/http.dart' as http;


class Api{
  search(String search) async{
    
    http.Response response = await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
    return decode(response);
  }

  decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);
      return decoded;
    }
    else{
      throw Exception("Failed");
    }
  }

}
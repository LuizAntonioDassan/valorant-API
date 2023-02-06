import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant/view/pages/agentPage.dart';
import 'package:valorant/view/styles/textstyle/textStyle.dart';
import 'package:valorant/model/api/api.dart';



class listAgent extends StatefulWidget {
  const listAgent({Key? key}) : super(key: key);

  @override
  State<listAgent> createState() => _listAgentState();
}

class _listAgentState extends State<listAgent> with SingleTickerProviderStateMixin {

  Color verde = const Color(0xff008000);

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: _getAgent(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Erro"),
            );
          }
          if(snapshot.hasData){
            List<dynamic> numAgents = snapshot.data!['data'];
            return ListView.builder(
                itemCount: numAgents.length,
                itemBuilder: (context, index){
                  if(snapshot.data!['data'][index]['isPlayableCharacter'] == true){
                    var name = snapshot.data!['data'][index]['displayName'];
                    var icon = snapshot.data!['data'][index]['displayIcon'];
                    var agent = snapshot.data!['data'][index];
                    var roleAgent = snapshot.data!['data'][index]['role']['displayName'];
                    var roleDescriptionAgent = snapshot.data!['data'][index]['role']['description'];
                    var roleIconAgent = snapshot.data!['data'][index]['role']['displayIcon'];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => agentPage(agent: agent)));
                      },
                      onLongPress: (){
                        _preview(context, roleAgent, roleDescriptionAgent, roleIconAgent);
                        },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(360)),
                            child: Image(
                                image: CachedNetworkImageProvider(
                                  icon,
                                  maxWidth: 256,
                                  maxHeight: 256,
                                )
                            ),
                          ),
                          subtitleStyle(name),
                        ],
                      ),
                    );
                  }else{
                    return Container();
                  }
                });
          }
          /*
          ListTile(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => agentPage(agent: agent)));
                      },
                      subtitle: subtitleStyle(name),
                      //função Image.network para transformar uma String em Image;
                      title: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(360)),
                        child: Image(
                          image: CachedNetworkImageProvider(
                            icon,
                            maxHeight: 256,
                            maxWidth: 256,
                          ),
                        )
                      ),
                      onLongPress: (){
                        _preview(context, roleAgent, roleDescriptionAgent, roleIconAgent);
                        },
                    );
           */

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget _preview(BuildContext context, String role, String description, String icon){
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Row(
                children: [
                  Image.network(icon, width: 60, height: 60, fit: BoxFit.contain, color: Colors.redAccent,),
                  SizedBox(width: 10,),
                  titleAlertTextStyle(role)
                ],
              ),
              alignment: Alignment.center,
              content: contentAlertTextStyle(description),
            );
          });
      return Container();
    }

    Future<Map> _getAgent() async {
      final value = Api.getData("https://valorant-api.com/v1/agents");
      return value;
  }
}


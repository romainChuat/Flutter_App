
import 'package:flutter/material.dart';
import 'mapPage.dart';
import 'mylib.dart' as mylib;

class startPage extends StatelessWidget {
  const startPage({super.key});

  @override
  Widget build(BuildContext context) {
   Map<String,Object> reponses =
      ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(appBar: AppBar()),
      endDrawer: mylib.createMenu(context),
      body: Center(
        child : ClipRRect(
                    borderRadius : BorderRadius.all(Radius.circular(10)),
                    
                    child:Container(                   
                       color: Color.fromARGB(255, 235, 233, 233),
                       width: 309,
                      height: 340,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Vous allez repondre à un questionnaire.',
                        style: mylib.titleStyle,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                    Text(
                      'Duration 10 min',
                      style: mylib.titleStyleDuration
                         
                    ),
                  ],
                ),
              ),
              SizedBox(
                width:280,
                  height: 49,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                   // backgroundColor: Color.fromARGB(255, 41, 59, 229),
                    side: const BorderSide(color: Colors.white, width: 1),
                    elevation: 15,
                    //padding: EdgeInsets.fromLTRB(10,0,110,0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => mapPage(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    );
                  },
                  child: const Text(
                    'Start Now',
                    style: mylib.titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
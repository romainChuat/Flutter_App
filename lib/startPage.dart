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
      body: Container(
        //decoration: mylib.background1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 90, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Vous allez repondre à un questionnaire.',
                        style: mylib.titleStyle2,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                    Text(
                      'Duration 10 min',
                      style: mylib.titleStyle
                          .apply(fontSizeDelta: -5, fontWeightDelta: -2),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 303,
                height: 72,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 41, 59, 229),
                    side: const BorderSide(color: Colors.white, width: 1),
                    elevation: 15,
                    //padding: EdgeInsets.fromLTRB(10,0,110,0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
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
                    style: mylib.buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

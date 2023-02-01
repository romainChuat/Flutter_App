import 'package:flutter/material.dart';
import 'etudePage.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';

class genrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _genrePage();
  }
}
class _genrePage extends State<genrePage> {
  int age = 0;
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme'
    : 'LightTheme';
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
              endDrawer: mylib.createMenu(context),

        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                Text('Title',style: mylib.titleStyle.apply(fontSizeDelta: 9, fontWeightDelta: -2,letterSpacingDelta: 3), textAlign: TextAlign.left,),
                ClipRRect(
                  
                  borderRadius: BorderRadius.circular(15.0),
                  child:Container(
                    width: 336,
                    height: 405,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("A quels genre vous identifiez vous ?", 
                            style: mylib.blueText,
                            textAlign: TextAlign.center,        
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 41, 59, 229),
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 32,                                
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Féminin", style: mylib.radioText), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                    setState(() {
                                      age = 10;
                                      print(age);
                                    });
                                  }, 
                                  value: 10,
                                )
                              ),
                              SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Masculin", style: mylib.radioText), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                      setState(() {
                                        age = 17;
                                        print(age);
                                      });
                                  }, 
                                  value: 17,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Autre genre", style: mylib.radioText), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                    setState(() {
                                        age = 25;
                                        print(age);
                                    });
                                  }, 
                                  value: 25,
                                ),
                              ),
                            ],
                          ) 
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41),
                 mylib.createNextButton("Next", context, 141, 41, MaterialPageRoute(builder: (_) => etudePage(),), )
                  ],
                )
              ],
            ),
          ),
        ));
  }
  

}

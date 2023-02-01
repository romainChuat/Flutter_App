import 'package:flutter/material.dart';
import 'genrePage.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';


class agePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _agePage();
  }
}
class _agePage extends State<agePage> {
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
                    //color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("Choisissez la tranche d'âge à laquelle vous situez-vous ?", 
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
                                    title: const Text("3 - 10 ans"), 
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

                                  title: const Text("11 - 17 ans"), 
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

                                  title: const Text("18 - 25 ans"), 
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
                              SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("26 - 35 ans"), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                     setState(() {
                                        age = 35;
                                        print(age);
                                    });
                                  }, 
                                  value: 35,
                                ),
                              ),    
                             SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("36 - 45 ans"), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                      setState(() {
                                        age = 45;
                                        print(age);
                                    });
                                  }, 
                                  value: 45,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("46 - 55 ans"), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                    setState(() {
                                        age = 55;
                                        print(age);
                                    });
                                  }, 
                                  value: 55,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("56 - 65 ans"), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                     setState(() {
                                        age = 65;
                                        print(age);
                                    });
                                  }, 
                                  value: 65,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("66 - 75 ans"), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                     setState(() {
                                        age = 75;
                                        print(age);
                                    });
                                  }, 
                                  value: 75,
                                ),
                              ),
                                SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("76 ans et plus"), 
                                  groupValue: age, 
                                  onChanged: (value) { 
                                     setState(() {
                                        age = 76;
                                        print(age);
                                    });
                                  }, 
                                  value: 76,
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
                    mylib.createNextButton("Next", context, 141, 41, MaterialPageRoute(builder: (_) => genrePage(),), )
                  ],
                )
              ],
            ),
          ),
        ));
  }
  

}

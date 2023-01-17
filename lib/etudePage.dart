import 'package:flutter/material.dart';
import 'package:flutter_application_1/activitePage.dart';
import 'package:flutter_application_1/genrePage.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';

class etudePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _etudePage();
  }
}
enum Niveau{ primaire, premierCycle, secondCycle, sup, bac3, bac5, doctorat, autre  }

class _etudePage extends State<etudePage> {
  //int age = 0;
  var niveau; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          decoration: mylib.background1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Title',style: mylib.titleStyle.apply(fontSizeDelta: 9, fontWeightDelta: -2,letterSpacingDelta: 3), textAlign: TextAlign.left,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child:Container(
                    width: 336,
                    height: 510,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("Quel est le plus haut niveau d'éducation dont vous avez béneficié à ce jour ?", 
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
                                height: 40,                                
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                    title: const Text("Niveau enseignement primaire.", style: mylib.radioText), 
                                    groupValue: niveau, 
                                    onChanged: (value) { 
                                      setState(() {
                                        niveau = Niveau.primaire;
                                        print(niveau);
                                      });
                                    }, 
                                  value: Niveau.primaire,                                
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Niveau premier cycle de l'enseignement secondaire (Collège) ou moins.", style: mylib.radioText), 
                                  groupValue: niveau, 
                                  onChanged: (value) { 
                                      setState(() {
                                        niveau = Niveau.premierCycle;
                                        print(niveau);
                                      });
                                  }, 
                                  value: Niveau.premierCycle,
                                ),
                              ),
                              SizedBox(
                                height: 65,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Niveau deuxième cycle de l'enseignement secondaire Lycée agricole, professionel.", style: mylib.radioText), 
                                  groupValue: niveau, 
                                  onChanged: (value) { 
                                    setState(() {
                                        niveau = Niveau.secondCycle;
                                        print(niveau);
                                    });
                                  }, 
                                  value: Niveau.secondCycle,
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Enseignement supérieur de cycle court(DEUG, BTS,DUT).", style: mylib.radioText), 
                                  groupValue: niveau, 
                                  onChanged: (value) { 
                                     setState(() {
                                        niveau = Niveau.sup;
                                        print(niveau);
                                    });
                                  }, 
                                  value: Niveau.sup,
                                ),
                              ),    
                             SizedBox(
                                height: 40,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Niveau licence ou équivalent BAC+3", style: mylib.radioText), 
                                  groupValue: niveau, 
                                  onChanged: (value) { 
                                      setState(() {
                                        niveau = Niveau.bac3;
                                        print(niveau);
                                    });
                                  }, 
                                  value: Niveau.bac3,
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Niveau master ou équivalent BAC+5", style: mylib.radioText), 
                                  groupValue: niveau, 
                                  onChanged: (value) { 
                                    setState(() {
                                        niveau = Niveau.bac5;
                                        print(niveau);
                                    });
                                  }, 
                                  value: Niveau.bac5,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child:RadioListTile(
                                  activeColor:  Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Doctorat", style: mylib.radioText), 
                                  groupValue: niveau, 
                                  onChanged: (value) { 
                                    setState(() {
                                        niveau = Niveau.doctorat;
                                        print(niveau);
                                    });
                                  }, 
                                  value: Niveau.doctorat,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child: RadioListTile(
                                    activeColor:  Color.fromARGB(255, 41, 59, 229),
                                    title: const Text("Autre", style: mylib.radioText), 
                                    groupValue: niveau, 
                                    onChanged: (value) { 
                                      setState(() {
                                        niveau = Niveau.autre;
                                        print(niveau);
                                      });
                                    }, 
                                    value: Niveau.autre,
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
                    SizedBox(
                      width: 141,
                      height: 41,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 41, 59, 229),
                          side: const BorderSide(color: Colors.white, width: 1),
                          elevation: 15,
                          //padding: EdgeInsets.fromLTRB(10,0,110,0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text( 'Quit', style: mylib.buttonTextStyle,),
                      ),
                    ),
                    SizedBox(
                      width: 141,
                      height: 41,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 41, 59, 229),
                          side: const BorderSide(color: Colors.white, width: 1),
                          elevation: 15,
                          //padding: EdgeInsets.fromLTRB(10,0,110,0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>  activitePage(),
                             ),
                          );
                        },
                        child: const Text( 'Submit', style: mylib.buttonTextStyle,),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
  

}

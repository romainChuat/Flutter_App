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
  var niveau;

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme'
    : 'LightTheme';
    Map<String, Object> reponses =
      ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: SingleChildScrollView (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Title',style: mylib.titleStyle.apply(fontSizeDelta: 9, fontWeightDelta: -2,letterSpacingDelta: 3), textAlign: TextAlign.left,),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
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
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
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
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
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
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
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
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
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
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
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
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
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
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
                                    });
                                  }, 
                                  value: Niveau.doctorat,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child: RadioListTile(
                                    activeColor:  Color.fromARGB(255, 41, 59, 229),
                                    title: mylib.createInput(0,30),
                                    groupValue: niveau, 
                                    onChanged: (value) { 
                                      setState(() {
                                        niveau = Niveau.autre;
                                        print(niveau);
                                        reponses['niveau_etude'] = niveau.toString().split('.').last;
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
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41, reponses),
                    mylib.createNextButton("Next", context, 141, 41, MaterialPageRoute(builder: (_) => activitePage(), settings: RouteSettings(arguments: reponses)), )
                  ],
                )
              ],
            ),
            ),
          ),
        ));
  }
  createInput(double wdth, double hgth,Map<String, Object> reponses ) {
  return SizedBox(
      height: hgth,
      width: wdth,
      child: const Material(
          elevation: 5,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            
            style: mylib.simpleText1,
            cursorColor: Color.fromARGB(255, 117, 106, 106),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 1),
              filled: true,
              fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
          )));
}
  

}

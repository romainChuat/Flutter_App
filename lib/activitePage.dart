import 'package:flutter/material.dart';
import 'package:flutter_application_1/genrePage.dart';
import 'endPage.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';

class activitePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _activitePage();
  }
}
class _activitePage extends State<activitePage> {

  String activite = "";
  bool _formationValue = false;
  bool _empValue = false;
  bool _proValue = false;
  bool _retraiteValue = false;
  bool _ssProValue = false;

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
                    width: 342,
                    height: 480,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("Quelle activité exercer vous actuellement ?", 
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
                          height: 400,
                          width: 330,
                          child: Column(
                            children: [
                              SizedBox(
                                      height: 80,
                                      width: 310,
                                      child:Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("En formation:"),
                                          ),
                                          CheckboxListTile(
                                            title: mylib.createInput(28),
                                            autofocus: false,
                                            selected: _formationValue,
                                            value: _formationValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _formationValue = value!;
                                                //enregistrer chaine de caracère
                                              });
                                            },
                                          ),
                                        ],
                                      )  
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 310,
                                      child:Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("A la recherche d'un emploi:"),
                                          ),
                                          CheckboxListTile(
                                            title: mylib.createInput(28),
                                            autofocus: false,
                                            selected: _empValue,
                                            value: _empValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _empValue = value!;
                                                //enregistrer chaine de caracère
                                              });
                                            },
                                          ),
                                        ],
                                      )  
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 310,
                                      child:Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Activité professionnelle:"),
                                          ),
                                          CheckboxListTile(
                                            title: mylib.createInput(28),
                                            autofocus: false,
                                            selected: _proValue,
                                            value: _proValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _proValue = value!;
                                                //enregistrer chaine de caracère
                                              });
                                            },
                                          ),
                                        ],
                                      )  
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 310,
                                      child:Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Retraité :"),
                                          ),
                                          CheckboxListTile(
                                            title: mylib.createInput(28),
                                            autofocus: false,
                                            selected: _retraiteValue,
                                            value: _retraiteValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _retraiteValue = value!;
                                                //enregistrer chaine de caracère
                                              });
                                            },
                                          ),
                                        ],
                                      )  
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 310,
                                      child:Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Sans activité professionnelle:"),
                                          ),
                                         CheckboxListTile(
                                            title: mylib.createInput(28),
                                            autofocus: false,
                                            selected: _ssProValue,
                                            value: _ssProValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _ssProValue = value!;
                                                //enregistrer chaine de caracère
                                              });
                                            },
                                          ),
                                        ],
                                      )  
                                    ),
                                  ],                     
                          ),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => endPage(),
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

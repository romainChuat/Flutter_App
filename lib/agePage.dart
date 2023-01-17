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
                    height: 405,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("Quels sont les mots et expressions qui vous viennent à l'esprit ?", 
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
                                    title: const Text("3 - 10 ans", style: mylib.radioText), 
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

                                  title: const Text("11 - 17 ans", style: mylib.radioText), 
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

                                  title: const Text("18 - 25 ans", style: mylib.radioText), 
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
                                  title: const Text("26 - 35 ans", style: mylib.radioText), 
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
                                  title: const Text("36 - 45 ans", style: mylib.radioText), 
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
                                  title: const Text("46 - 55 ans", style: mylib.radioText), 
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
                                  title: const Text("56 - 65 ans", style: mylib.radioText), 
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
                                  title: const Text("66 - 75 ans", style: mylib.radioText), 
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
                                  title: const Text("76 ans et plus", style: mylib.radioText), 
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
                            builder: (_) => genrePage(),
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

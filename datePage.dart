import 'package:flutter/material.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';
import 'package:flutter_application_1/motPage.dart';

class datePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _datePage();
  }
}
class _datePage extends State<datePage> {
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
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
                    height: 280,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("Veuillez indiquez la date de votre image envoyer", 
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
                        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                        SizedBox(
                          width: 265,
                          height: 180,
                          child: Column(
                            children: [
                              SizedBox(
                                width:250,
                                height: 45,
                                child:Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: TextField(
                                    style: mylib.simpleText.apply(fontSizeDelta: 5),

                                    controller: dateInput,
                                  //editing controller of this TextField
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.calendar_today , color: Color.fromARGB(255, 41, 59, 229), size: 30,), //icon of text field
                                    //labelText: "Enter Date",
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Enter a date',
                                      contentPadding: const EdgeInsets.fromLTRB(10,1,0,0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width:1, color: Color.fromARGB(255, 255, 255, 255),),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width:1, color: Color.fromARGB(255, 255, 255, 255),),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                      )
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));
                                    if (pickedDate != null) {
                                      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                      setState(() {
                                        dateInput.text = formattedDate; //set output date to TextField value.
                                      });
                                    } //else {}
                                  },
                                ),
                              )
                                //Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                              //Text("! Veuillez envoyez au plus 1 fichier", style: mylib.warningText,)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41),
                    mylib.createNextButton("Next", context, 141, 41, MaterialPageRoute(builder: (_) => motPage(),), )
                  ],
                )
              ],
            ),
          ),
        ));
  }
  

}

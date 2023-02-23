import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/start_page.dart';
import 'mylib.dart' as mylib;
import 'package:flutter_application_1/mot_page.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Datepage();
  }
}

class Datepage extends State<DatePage> {
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 290,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                          child: Text(
                            "datePage_title".tr(),
                            style: mylib.titleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 0)),
                        SizedBox(
                          width: 265,
                          height: 180,
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 275,
                                  height: 45,
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: TextField(
                                      style: mylib.simpleText
                                          .apply(fontSizeDelta: 5),

                                      controller: dateInput,
                                      //editing controller of this TextField
                                      decoration: const InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.calendar_today,
                                            color: Colors.black,
                                            size: 30,
                                          ), //icon of text field
                                          //labelText: "Enter Date",
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Entrer une date',
                                          contentPadding:
                                              EdgeInsets.fromLTRB(10, 1, 0, 0),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)))),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1950),
                                            //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2100));
                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                              DateFormat('dd/MM/yyyy')
                                                  .format(pickedDate);
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2021-03-16
                                          setState(() {
                                            dateInput.text =
                                                formattedDate; //set output date to TextField value.
                                            reponses["rep_date"] =
                                                dateInput.text;
                                          });
                                        }
                                      },
                                    ),
                                  )
                                
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
                    mylib.createQuitButton(
                        context, 141, 41, const StartPage(), reponses),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => const MotPage(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
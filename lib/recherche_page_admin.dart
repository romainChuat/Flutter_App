import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'mylib.dart' as mylib;

import 'droits_auteur.dart';

class Recherchepage extends StatefulWidget {
  const Recherchepage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Recherchepage();
  }
}

class _Recherchepage extends State<Recherchepage> {
  TextEditingController controllerSearch = TextEditingController();
  List allresults = [];
  List resultsList = [];
  
  @override
/*void initState() {
  super.initState();
  controllerSearch.addListener(listResult());
}*/
listResult(){
  var results = [];
  // si il y a des mot dans la barre recherche
  if(controllerSearch.text != ""){
    //on affiche selon la recherche

  }else{
    results = List.from(allresults);
  }
  setState(() {
    resultsList = results;
  });

}

get(){
  // appeler base
  //faire requete
  var resul; //-->resultat de la requete
  setState(() {
    allresults = resul.toList();
  });
  listResult();
}

  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Container(
        
        child: Column(
          children: [
            SizedBox(height: 50,),
            
            TextField(
              controller: controllerSearch,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),

            ),
           
          ],
        ),
      ),
    );
  }
}

//GererAvisValide
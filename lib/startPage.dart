import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/baseAppBar.dart';
import 'mapPage.dart';



class startPage extends StatelessWidget{
  final background_blue;
  
  const startPage({this.background_blue});
  @override
  Widget build(BuildContext context) {

    /** */
    const TextStyle TitleStyle = TextStyle(
      fontFamily: 'Spline Sans Mono', 
      fontSize: 25, 
      fontWeight: FontWeight.bold, 
      color: Colors.white, 
      shadows:<Shadow> [ Shadow(offset:Offset(-2.0, 2.0) , blurRadius: 3.0 ,color: Color.fromARGB(195, 105, 105, 105))], 
      letterSpacing: 0,
    );

    const TextStyle buttonTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Nunito', letterSpacing: 1 );

    /*** */

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: baseAppBar(appBar: AppBar()),
      body: Container(
        decoration: background_blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 90, 0),
                child:Column(  
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget> [
                    const Align(
                      alignment: Alignment.center,
                      child:Text('Vous allez repondre à un questionnaire.',style: TitleStyle, ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                    Text('Duration 10min', style: TitleStyle.apply(fontSizeDelta: -10,fontWeightDelta: -2),),
                  ],
                ),
              ),
              SizedBox(
                  width:303,
                  height: 72,
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 41, 59, 229),
                      side: const BorderSide(color: Colors.white, width: 1),
                      elevation: 15,
                      //padding: EdgeInsets.fromLTRB(10,0,110,0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const mapPage(),
                        ),
                      );
                    }, 
                    child: const Text('Start Now', style: buttonTextStyle,),
                  ),
                ),
            ],
          ),
        ),
      ),
    );

  }
}
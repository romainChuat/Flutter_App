import 'package:flutter/material.dart';
import 'package:flutter_icon_shadow/flutter_icon_shadow.dart';

import 'mylib.dart' as mylib;

import 'dart:math' as math;

class endPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _endPage();
  }
}
class _endPage extends State<endPage> {
  String activite = "";
  bool _value = false;
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
                Text('Merci, Login',style: mylib.titleStyle.apply(fontSizeDelta: 9, fontWeightDelta: -2,letterSpacingDelta: 3), textAlign: TextAlign.left,),
                
                  SizedBox(
                    width: 342,
                    height: 480,
                    child: Stack(
                      alignment: Alignment.center,
                      children:  [
                        /*const IconShadow(
                          Icon(
                            Icons.check, color: Color.fromARGB(255,95, 202, 131), size: 180,
                          ),
                          shadowColor: Color.fromARGB(255, 63, 63, 63),
                          shadowOffset: Offset(2,2),
                        ),*/
                        
                       
                        const IconShadow(
                          Icon(Icons.check_circle_outline, size: 320, color: Color.fromARGB(255,95, 202, 131)),
                          shadowColor: Color.fromARGB(255, 63, 63, 63),
                          shadowOffset: Offset(2,2),
                        ),
                         CustomPaint(
                          painter: MakeCircle(strokeWidth: 15,strokeCap: StrokeCap.round, color: Colors.white, rad:130  ),
                          //foregroundPainter: MakeCircle(strokeWidth: 15, strokeCap: StrokeCap.round, rad: 135, color: Colors.white ),
                        ),
                      ],                      
                  ),
                ),
                
              ],
            ),
          ),
        ));
  }
  

}

class MakeCircle extends CustomPainter {
  final double strokeWidth;
  final StrokeCap strokeCap;
  final double rad;
  final Color color;
  MakeCircle({this.strokeCap = StrokeCap.square, this.strokeWidth = 10.0, this.rad = 120, this.color = const Color.fromARGB(255,95, 202, 131)});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //important set stroke style

      canvas.drawCircle(Offset(0, 0 ), rad, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}





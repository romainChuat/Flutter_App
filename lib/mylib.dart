library mylib;
import 'package:flutter/material.dart';

const Decoration background1 =  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                Color.fromARGB(255,255,255,0),
                Color.fromARGB(138,35, 175, 74),
                Color.fromARGB(160,54, 192, 201),
                Color.fromARGB(255,41, 59, 229),
                ],
                tileMode: TileMode.mirror,
              ),
);

const TextStyle titleStyle = TextStyle(
      fontSize: 21, 
      fontFamily: 'Spline Sans Mono', 
      fontWeight: FontWeight.bold, 
      color: Colors.white, 
      shadows:<Shadow> [ Shadow(offset:Offset(-2.0, 2.0) , blurRadius: 3.0 ,color: Color.fromARGB(195, 105, 105, 105))], 
      letterSpacing: -1,
);
const TextStyle titleStyle2 = TextStyle(
      fontSize: 25, 
      fontFamily: 'Spline Sans Mono', 
      fontWeight: FontWeight.bold, 
      color: Colors.white, 
      shadows:<Shadow> [ Shadow(offset:Offset(-2.0, 2.0) , blurRadius: 3.0 ,color: Color.fromARGB(195, 105, 105, 105))], 
      letterSpacing: -1,
);



const TextStyle buttonTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Nunito', letterSpacing: 1 );

const TextStyle blueText = TextStyle(
  fontSize: 20, 
  fontWeight: FontWeight.w800, 
  color: Color.fromARGB(255, 41, 59, 229), 
  fontFamily: 'Nunito', 
  letterSpacing: 1,
  //shadows:<Shadow> [ Shadow(offset:Offset(-1.0, 1.0) , blurRadius: 5.0 ,color: Color.fromARGB(195, 105, 105, 105))], 
  
);
const TextStyle radioText = TextStyle(
  fontSize: 15, 
  fontWeight: FontWeight.w600, 
  color: Color.fromARGB(255, 41, 59, 229), 
  fontFamily: 'Nunito', 
  letterSpacing: 1,
  //shadows:<Shadow> [ Shadow(offset:Offset(-1.0, 1.0) , blurRadius: 5.0 ,color: Color.fromARGB(195, 105, 105, 105))], 
  
  );

const TextStyle simpleText = TextStyle(
  fontSize: 15, 
   
  color: Color.fromARGB(255, 117, 106, 106), 
  fontFamily: 'Spline Sans Mono', 
  letterSpacing: 1,
  
  );
const TextStyle warningText = TextStyle(
  fontSize: 11,    
  color: Color.fromARGB(255, 208, 40, 40), 
  fontFamily: 'Spline Sans Mono', 
  letterSpacing: 0,
  
  );

// ignore: slash_for_doc_comments
/**
 * AppBar
 */

class baseAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;

  const baseAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          icon: const Icon(Icons.arrow_back_ios, size: 40,),
          tooltip: '....',
          onPressed: () { Navigator.pop(context);
          },
        ),
        actions: const [ 
          Icon(Icons.menu, size: 50,),
          Padding(padding: EdgeInsets.fromLTRB(0,0,20,0))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

createInput(double hgth){
  return SizedBox(
    height: hgth,
    child:Material(
      elevation: 5,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child :TextField(
        style: simpleText.apply(fontSizeDelta: 5),
        cursorColor: Color.fromARGB(255, 117, 106, 106),
        decoration: InputDecoration(
          /*prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(2,2,0,0),
            //child: Text('${index+1}.', style: mylib.simpleText.apply(fontSizeDelta: 5) ,),
          ),*/
          contentPadding: const EdgeInsets.fromLTRB(0,0,0,1),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width:1, color: Color.fromARGB(255, 255, 255, 255),),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width:1, color: Color.fromARGB(255, 255, 255, 255),),
            borderRadius: BorderRadius.all(Radius.circular(15))
          )
        ),
      )
    )
  );
}
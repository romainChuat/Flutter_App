library mylib;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/languagePage.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

import 'controller/language_contoller.dart';

const Decoration background1 = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color.fromARGB(255, 255, 255, 0),
      Color.fromARGB(138, 35, 175, 74),
      Color.fromARGB(160, 54, 192, 201),
      Color.fromARGB(255, 41, 59, 229),
    ],
    tileMode: TileMode.mirror,
  ),
);

const TextStyle titleStyle = TextStyle(
  fontSize: 21,
  fontFamily: 'Spline Sans Mono',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  shadows: <Shadow>[
    Shadow(
        offset: Offset(-2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(195, 105, 105, 105))
  ],
  letterSpacing: -1,
);
const TextStyle titleStyle2 = TextStyle(
  fontSize: 25,
  fontFamily: 'Spline Sans Mono',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  shadows: <Shadow>[
    Shadow(
        offset: Offset(-2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(195, 105, 105, 105))
  ],
  letterSpacing: -1,
);
const TextStyle titleStyle3 = TextStyle(
  fontSize: 22,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.bold,
  color: Colors.black,
  letterSpacing: 1,
);
const TextStyle titleStyle4 = TextStyle(
  fontSize: 20,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.bold,
  color: Color(0xff746a6a),
  letterSpacing: 1,
);
const TextStyle titleStyle5 = TextStyle(
  fontSize: 20,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  letterSpacing: 1,
);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Nunito',
    letterSpacing: 1);

const TextStyle blueText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Color.fromARGB(255, 41, 59, 229),
  fontFamily: 'Nunito',
  letterSpacing: 1,
);
const TextStyle blueText1 = TextStyle(
  fontSize: 12,
  color: Color.fromARGB(255, 41, 59, 229),
  fontFamily: 'Spline Sans Mono ',
  letterSpacing: 1,
  //shadows:<Shadow> [ Shadow(offset:Offset(-1.0, 1.0) , blurRadius: 5.0 ,color: Color.fromARGB(195, 105, 105, 105))],
);
const TextStyle blueText2 = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 41, 59, 229),
  fontFamily: 'Spline Sans Mono ',
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
const TextStyle simpleText1 = TextStyle(
  fontSize: 15,
  color: Color.fromARGB(255, 117, 106, 106),
  fontWeight: FontWeight.w600,
  fontFamily: 'Nunito',
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

class baseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const baseAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 40,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      /*actions: const [ 
          Icon(Icons.menu, size: 50,),
          Padding(padding: EdgeInsets.fromLTRB(0,0,20,0))
        ],*/
      actions: [
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: 50,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0)),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

createInput(
  double wdth,
  double hgth,
) {
  return SizedBox(
      height: hgth,
      width: wdth,
      child: const Material(
          elevation: 5,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            style: simpleText1,
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

createInputTextArea(double wdth, double hgth) {
  return SizedBox(
      height: hgth,
      width: wdth,
      child: const Material(
          elevation: 5,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            maxLength: 200,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: simpleText1,
            cursorColor: Color.fromARGB(255, 117, 106, 106),
            decoration: InputDecoration(
              counterText: "",
              hintText: 'Tapez votre texte...',
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
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          )));
}

createQuitButton(BuildContext context, double width, double height, var path) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
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
            builder: (context) => path,
          ),
        );
      },
      child: Text("Quit", style: buttonTextStyle),
    ),
  );
}

createNextButton(String text, BuildContext context, double width, double height,
    MaterialPageRoute page) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
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
          page,
        );
      },
      child: Text(
        text,
        style: buttonTextStyle,
      ),
    ),
  );
}

createtButton(String text, BuildContext context, double width, double height) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        //foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 41, 59, 229),
        //side: const BorderSide(color: Colors.white, width: 1),
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: buttonTextStyle,
      ),
    ),
  );
}

createMenu(BuildContext context) {
  LanguageController controller = context.read<LanguageController>();

  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      padding: EdgeInsets.all(10),
      width: 240,
      child: Drawer(
        backgroundColor: Color.fromARGB(255, 30, 77, 233),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(30)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 200,
                height: 58,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 41, 59, 229),
                      backgroundColor: Color.fromARGB(255, 235, 233, 233),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(6)),
                        Text(
                          "Menu",
                          style: blueText,
                        ),
                      ],
                    )),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 200,
                height: 58,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 41, 59, 229),
                      backgroundColor: Color.fromARGB(255, 235, 233, 233),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.lens, size: 18),
                        Padding(padding: EdgeInsets.all(6)),
                        Text(
                          "Deconnexion",
                          style: blueText,
                        ),
                      ],
                    )),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 200,
                height: 58,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 41, 59, 229),
                      backgroundColor: Color.fromARGB(255, 235, 233, 233),
                    ),
                    onPressed: () {
                      AdaptiveTheme.of(context).setDark();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ChangeThemeButtonWidget(),
                        Text(
                          "Mode sombre",
                          style: blueText,
                        ),
                      ],
                    )),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 200,
                height: 58,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 41, 59, 229),
                      backgroundColor: Color.fromARGB(255, 235, 233, 233),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => languagePage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.lens, size: 18),
                        Padding(padding: EdgeInsets.all(6)),
                        Text(
                          "Traduire",
                          style: blueText,
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void setState(Null Function() param0) {}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_icon_shadow/flutter_icon_shadow.dart';
import 'database_helper_local.dart';
import 'package:easy_localization/easy_localization.dart';
import 'mylib.dart' as mylib;

class endPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _endPage();
  }
}

class _endPage extends State<endPage> {
  var insert_lieuxID;
  var insert_usID;



  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    print(reponses);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: const Color.fromARGB(255, 235, 233, 233),
                width: 309,
                height: 530,
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("endPage_thanks".tr(), style: mylib.titleStyle),
                        Text("${reponses["user_name"]}",
                            style: mylib.titleStyle),
                      ],
                    ),
                    SizedBox(
                      width: 320,
                      height: 350,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const IconShadow(
                            Icon(
                              Icons.check_circle_outline,
                              size: 320,
                              color: Color.fromARGB(255, 13, 12, 32),
                            ),
                            shadowColor: Color.fromARGB(255, 63, 63, 63),
                            shadowOffset: Offset(2, 2),
                          ),
                          CustomPaint(
                            painter: MakeCircle(
                                strokeWidth: 15,
                                strokeCap: StrokeCap.round,
                                color: Colors.white,
                                rad: 130),
                          ),
                        ],
                      ),
                    ),
                    createSubmitButton(141, 41, reponses),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  createSubmitButton(
      double width, double height, Map<String, Object> reponses) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1),
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          //envoie des données à la bd
          insertUser(reponses);
          print(insert_usID);
          print(insert_lieuxID);
          insertLieu(reponses);
          insertReponse(reponses);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MyHomePage(),
                settings: RouteSettings(arguments: reponses),
              ));
        },
        child: Text(
          "btn_submit".tr(),
          style: mylib.titleStyle,
        ),
      ),
    );
  }
  void insertLieu(Map<String,Object> reponses) async{
    Map<String,Object> lieux = new Map();
    lieux['lieux_lat'] = reponses['latitude']!;
    lieux['lieux_long'] = reponses['longitude']!;
    reponses.remove('longitude');
    reponses.remove('latitude');
    print(lieux);
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelperLocal db = DatabaseHelperLocal();
    try {
      insert_lieuxID = await db.insertLieu(lieux);
      print("new lieux");
    } catch (e) {
      print("enregistrement lieux impossible");
    }
  }
  void insertUser(Map<String,Object> reponses) async{
    Map<String, Object> user = new Map();
    user['user_name'] = "gest_${reponses['username']!}";
    reponses.remove('username');
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelperLocal db = DatabaseHelperLocal();
    try{
      insert_usID = await db.insertUser(user);
      reponses['already_register'] = true;
      print("new user");
    }catch(e){
      print("enregistrement user impossible");
    }
  }
  void insertReponse(Map<String, Object> reponses) async {
    print(reponses);

    reponses['rep_userID'] = 1;
    reponses['rep_lieuxID'] = 1;
    print(reponses);
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelperLocal db = DatabaseHelperLocal();
    try {
      await db.insertReponse(reponses);
      print("new reponse");
    } catch (e) {
      print("enregistrement reponse impossible");
    }
  }
}

class MakeCircle extends CustomPainter {
  final double strokeWidth;
  final StrokeCap strokeCap;
  final double rad;
  final Color color;
  MakeCircle(
      {this.strokeCap = StrokeCap.square,
      this.strokeWidth = 10.0,
      this.rad = 120,
      this.color = const Color.fromARGB(255, 95, 202, 131)});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //important set stroke style

    canvas.drawCircle(const Offset(0, 0), rad, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

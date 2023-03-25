library mylib;

import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/language_page.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:postgres/postgres.dart';
import 'package:provider/provider.dart';
import 'confirmation_deconnexion.dart';
import 'controller/language_contoller.dart';
import 'package:quickalert/quickalert.dart';
import 'database_helper.dart';
import 'database_helper_local.dart';

bool adminConnect = false;

/// IDENTIFIANTS DE CONNEXION BASE DE DONNÉES
const bduser = "postgres";
const bdpass = "fluttertest";
const bdserver = "10.0.2.2";
const bdname = "city";

const TextStyle titleStyle = TextStyle(
  fontSize: 21,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w400,
  letterSpacing: -1,
);
const TextStyle titleStyleMenu = TextStyle(
  fontSize: 25,
  fontFamily: 'Nunito',
  color: Colors.white,
  fontWeight: FontWeight.w400,
  letterSpacing: -1,
);
const TextStyle titleStyleBasDePage = TextStyle(
  fontSize: 18,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w400,
);
const TextStyle titleStyleDuration = TextStyle(
  fontSize: 17,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w400,
  letterSpacing: -1,
);
const TextStyle titleStyle2 = TextStyle(
  fontSize: 25,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.bold,
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
  // color: Colors.white,
  letterSpacing: 1,
);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
    letterSpacing: 1);

const TextStyle blueText2 = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontFamily: 'Spline Sans Mono ',
  letterSpacing: 1,
  //shadows:<Shadow> [ Shadow(offset:Offset(-1.0, 1.0) , blurRadius: 5.0 ,color: Color.fromARGB(195, 105, 105, 105))],
);
const TextStyle radioText = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  fontFamily: 'Nunito',
  letterSpacing: 1,
);

const TextStyle simpleText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
  fontFamily: 'Nunito',
  letterSpacing: 1,
);

const TextStyle simpleTextdark = TextStyle(
  fontSize: 15,
  color: Colors.black,
  fontFamily: 'Spline Sans Mono',
  letterSpacing: 1,
);

const TextStyle simpleTextwhite = TextStyle(
  fontSize: 15,
  color: Colors.white,
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

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const BaseAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 40,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
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
        const Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0)),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class BaseAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const BaseAppBar1({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: LinearPercentIndicator(
          padding: const EdgeInsets.fromLTRB(60, 0, 25, 0),
          //      width: MediaQuery.of(context).size.width - 100,
          width: MediaQuery.of(context).size.width - 50,
          //animation: true, àp laisser commenter si ajout de l'animation
          lineHeight: 20.0,
          //animationDuration: 2000,
          percent: 20.0,
          linearStrokeCap: LinearStrokeCap.roundAll,
          // progressColor: Colors.greenAccent,
          backgroundColor: const Color.fromARGB(255, 235, 233, 233),
          progressColor: const Color.fromARGB(255, 13, 12, 32),
        ),
      ),
      leading: IconButton(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 40,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
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
        const Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0)),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

percentIndicator(BuildContext context, double percentPage) {
  return LinearPercentIndicator(
    padding: const EdgeInsets.fromLTRB(60, 0, 25, 0),
    //      width: MediaQuery.of(context).size.width - 100,
    width: MediaQuery.of(context).size.width - 50,
    //animation: true, // a laiksser si le souhait d'une animation
    lineHeight: 20.0,
    //animationDuration: 2000,
    percent: percentPage,
    linearStrokeCap: LinearStrokeCap.roundAll,
    // progressColor: Colors.greenAccent,
    backgroundColor: const Color.fromARGB(255, 235, 233, 233),
    progressColor: const Color.fromARGB(255, 13, 12, 32),
  );
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

createQuitButton(BuildContext context, double width, double height, var path,
    Map<String, Object>? args) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 1),
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => path,
            settings: RouteSettings(arguments: args),
          ),
        );
      },
      child: Text("btn_quit".tr(), style: titleStyle),
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
        style: titleStyle,
      ),
    ),
  );
}

createNextButton1(String text, BuildContext context, double width,
    double height, Map<String, Object> reponses, MaterialPageRoute page) {
  var insertlieuxID;
  var insertusID;
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 1),
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          text: 'Êtes-vous sûr de vouloir envoyer vos réponses ?',
          confirmBtnText: 'Yes',
          onConfirmBtnTap: () async {
            var userID = reponses['rep_userID'].toString();
            var userIDServer = reponses['rep_userIDServer'].toString();
            var username = reponses['username'].toString();
            var lat = reponses['lieu_lat'].toString();
            var long = reponses['lieu_long'].toString();
            reponses.remove('username');
            reponses.remove('rep_userID');
            reponses.remove('rep_userIDServer');
            reponses.remove('mail');
            reponses['rep_date_validation'] =
                DateFormat("dd/MM/yyyy").format(DateTime.now()).toString();

            if (await InternetConnectionChecker().hasConnection) {
              //insertion dans le server
              //if(reponses.containsKey('rep_userIDServer')){

              //}else{
              //WidgetsFlutterBinding.ensureInitialized();
              //DatabaseHelper db = DatabaseHelper.getInstance();
              /*if(reponses.containsKey('mail')){
                  //userIDServer = query BY MAIL
                  // checker si inserer en server 
                }else{
                  //user ID = insert user 
                }*/
              //}
              print("insertion server");
              reponses['rep_user'] = userIDServer;
              await insertLieuServer(reponses);
              await insertReponseServer(reponses);
            }
            //insertion dans la base local
            print("insertion local");
            reponses['rep_user'] = userID;
            reponses['lieu_lat'] = lat;
            reponses['lieu_long'] = long;
            await insertLieuLocal(reponses);
            await insertReponse(reponses);
            reponses['username'] = username;
            Navigator.of(context).push(page);
          },
          cancelBtnText: 'No',
          confirmBtnColor: const Color.fromARGB(255, 64, 224, 168),
        );
      },
      child: Text(
        text,
        style: titleStyle,
      ),
    ),
  );
}

Future<void> insertLieuLocal(Map<String, Object> reponses) async {
  Map<String, Object> lieux = new Map();
  var insert_lieuxID;
  lieux['lieu_lat'] = reponses['lieu_lat']!;
  lieux['lieu_long'] = reponses['lieu_long']!;
  reponses.remove('lieu_lat');
  reponses.remove('lieu_long');
  print(lieux);
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelperLocal db = DatabaseHelperLocal();
  try {
    insert_lieuxID = await db.insertLieu(lieux);
    print("new lieux local");
  } catch (e) {
    print("enregistrement lieux impossible");
  }
  reponses['rep_lieu'] = insert_lieuxID;
}

Future<void> insertLieuServer(Map<String, Object> reponses) async {
  Map<String, Object> lieux = new Map();
  var insert_lieuxID;
  lieux['lieu_lat'] = reponses['lieu_lat']!;
  lieux['lieu_long'] = reponses['lieu_long']!;
  reponses.remove('lieu_lat');
  reponses.remove('lieu_long');
  print(lieux);
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = DatabaseHelper.getInstance();
  try {
    insert_lieuxID = await db.insertLieu(lieux);
    print("new lieux server");
  } catch (e) {
    print("enregistrement lieux server impossible");
  }
  reponses['rep_lieu'] = insert_lieuxID[0][0];
  //return insert_lieuxID;
}

Future<int?> insertUserLocal(Map<String, dynamic> user) async {
  var usID;
  if (!user.containsKey('password')) {
    user['nom'] = "gest_${user['nom']}";
  }
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelperLocal db = DatabaseHelperLocal();
  try {
    usID = await db.insertUser(user);
    print("new user local");
  } catch (e) {
    print("enregistrement LOCAL user impossible");
  }
  return usID;
}

Future<PostgreSQLResult?> insertUserServer(Map<String, dynamic> user) async {
  var usID;
  user['nom'] = "${user['nom']}";
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = DatabaseHelper.getInstance();
  try {
    usID = await db.insertUser(user);
    print(usID);
    print("new user server");
  } catch (e) {
    print("enregistrement SERVER user impossible");
  }
  return usID;
}

Future<void> insertReponse(Map<String, Object> reponses) async {
  print(reponses);
  Map<String, Object> data = reponses;
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelperLocal db = DatabaseHelperLocal();
  try {
    await db.insertReponse(reponses);
    print("new reponse");
  } catch (e) {
    print("enregistrement Local reponse impossible");
    print(e);
  }
}

Future<void> insertReponseServer(Map<String, Object> reponses) async {
  // A FAIRE !!! RECUPERER LES REPONSE LOCAL NON INSERER DANS LE SERVER
  //WidgetsFlutterBinding.ensureInitialized();
  //DatabaseHelperLocal db = DatabaseHelperLocal();
  //var res = await db.queryAllRowsReponse();
  //final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
  //WidgetsFlutterBinding.ensureInitialized();
  //get user ID
  //dbHelper.queryUser(mail)
  /*for (var i in res) {
        try {
          print(i.toString());
          await dbHelper.insertReponses(i.toMap());
          print(i.toMap());
          print("new row");
          await db.deleteAllReponses();
        } catch (e) {
          print("enregistrement server reponse impossible");
        }
      }*/

  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  print(reponses);
  try {
    await dbHelper.insertReponses(reponses);
    print("reponse reponse server");
  } catch (e) {
    print("enregistrement reponse server impossible");
    print(e);
  }
}

createtButton(String text, BuildContext context, double width, double height) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 13, 12, 32),
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: titleStyle,
      ),
    ),
  );
}

createMenu(BuildContext context) {
  LanguageController controller = context.read<LanguageController>();
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      padding: const EdgeInsets.all(10),
      width: 260,
      child: Drawer(
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                  height: 78,
                  color: const Color.fromARGB(255, 13, 12, 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "menu_title".tr(),
                        style: titleStyleMenu,
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  )),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 230,
                height: 58,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 13, 12, 32),
                      backgroundColor: const Color.fromARGB(255, 235, 233, 233),
                    ),
                    onPressed: () {
                      adminConnect = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ConfirmationDeconnexion(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.lens, size: 18),
                        const Padding(padding: EdgeInsets.all(6)),
                        Text(
                          "btn_deconnexion".tr(),
                          style: titleStyle,
                        ),
                      ],
                    )),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 230,
                height: 58,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 13, 12, 32),
                      backgroundColor: const Color.fromARGB(255, 235, 233, 233),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LanguagePage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.lens, size: 18),
                        const Padding(padding: EdgeInsets.all(6)),
                        Text(
                          "btn_traduire".tr(),
                          style: titleStyle,
                        ),
                      ],
                    )),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 230,
                height: 58,
                child: Container(
                    width: 336,
                    height: 570,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ChangeThemeButtonWidget(),
                        Text(
                          "btn_mode_sombre".tr(),
                          style: titleStyle,
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

Future<String?> getImage(int userID) async{
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  String? image;
  try {
    image = await dbHelper.getImageUser(userID);
  } catch (e) {
    print(e);
    print("impossible de recuperer l'image");
  }
  //print("image");
  //print(image);
  return image;
}
Future<List> getReponses(userID) async{
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  List? reponse;
  try{
    reponse = await dbHelper.queryReponsesUser(userID);
  }catch(e){
    print(e);
    print("impossible de recuperer la reponses");
  }
  List res = reponse![0];
  print(res);
  return reponse[0]; ///// A REVOIR !!!!
}
Future<void> validerReponses(int rep_id) async{
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  var reponse;
  print(rep_id);
  print("valider");
  try{
    reponse = await dbHelper.setValider(int.parse(rep_id.toString()));
  }catch(e){
    print(e);
    print("impossible de modifier la reponses");
  }
}
Future<void> refuserReponses(int rep_id) async{
  final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  var reponse;
  print(rep_id);
  print("refuser");
  try{
    reponse = await dbHelper.setRefuser(int.parse(rep_id.toString()));
  }catch(e){
    print(e);
    print("impossible de modifier la reponses");
  }
}
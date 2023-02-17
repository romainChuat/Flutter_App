import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/endPage.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'donner_avis_marker.dart';
import 'homePage.dart';
import 'mylib.dart' as mylib;

class confirmation_deconnexion extends StatefulWidget {
  const confirmation_deconnexion({super.key});

  @override
  State<confirmation_deconnexion> createState() => _confirmation_deconnexion();
}

class _confirmation_deconnexion extends State<confirmation_deconnexion> {
  bool darkmode = false;
  dynamic savedThemeMode;

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      print('mode sombre');
      setState(() {
        darkmode = true;
      });
    } else {
      setState(() {
        darkmode = false;
      });
      print('mode clair');
    }
  }

  Widget buildBtnYes() {
    return SizedBox(
      width: 120,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => userchoixconnexion(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Oui",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildBtnNo() {
    return SizedBox(
      width: 120,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
                Navigator.pop(context);
              },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Non",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: const Color.fromARGB(255, 235, 233, 233),
            width: 309,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250,
                ),
                                const SizedBox(height: 15),

                const SizedBox(

                  child: Text(
                      'Voulez-vous vous déconnecter ?',
                      style: mylib.titleStyle),
                ),
                                const SizedBox(height: 35),

                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                //const SizedBox(height: 5),
                buildBtnYes(),
              //  const SizedBox(height: ),
                buildBtnNo(),
                const SizedBox(height: 61),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

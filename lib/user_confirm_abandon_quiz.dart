import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'hello_login_page.dart';
import 'hello_login_password.dart';
import 'home_page.dart';
import 'mylib.dart' as mylib;

class confirmationAbandon extends StatefulWidget {
  const confirmationAbandon({super.key});

  @override
  State<confirmationAbandon> createState() => _confirmationAbandon();
}

class _confirmationAbandon extends State<confirmationAbandon> {
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

  Widget buildBtnYes(reponses) {
    return SizedBox(
      width: 120,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          if (reponses['mail'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const HelloLoginPage(),
                settings: RouteSettings(arguments: reponses),
              ),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const HelloLoginPassword(),
                settings: RouteSettings(arguments: reponses),
              ),
            );
          }
          ;
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "btn_yes".tr(),
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
        child: Text(
          "btn_no".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    context.watch<LanguageController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(
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
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                  child: Text('user_confirmation_abandon_title'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildBtnYes(reponses),
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

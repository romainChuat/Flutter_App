import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'accueil_gerer_les_avis.dart';
import 'accueil_gerer_les_markers.dart';
import 'mylib.dart' as mylib;

class HelloAdminPage extends StatefulWidget {
  const HelloAdminPage({super.key});

  @override
  State<HelloAdminPage> createState() => Helloadminpage();
}

class Helloadminpage extends State<HelloAdminPage> {
  Widget gererLesMarkers() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const AccueilGererLesMarkers(),
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
        child: Text(
          "hello_admin_page_btn_gerer_markers".tr(),
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererLesAvis() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const AccueilGererLesAvis(),
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
        child: Text(
          "hello_admin_page_btn_gerer_avis".tr(),
          style: mylib.titleStyle5,
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
            height: 464,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  child: Text('hello_admin_page_title1'.tr(),
                      style: mylib.titleStyle2),
                ),
                const SizedBox(height: 61),
                SizedBox(
                  width: 250,
                  child: Text('hello_admin_page_title2'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 61),
                gererLesMarkers(),
                const SizedBox(height: 30),
                gererLesAvis(),
                const SizedBox(height: 61),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

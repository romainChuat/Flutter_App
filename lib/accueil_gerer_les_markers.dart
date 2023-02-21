import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'traiter_markers_recu_admin.dart';
import 'gerer_les_markers_recu_admin_choisis.dart';
import 'gerer_markers_refuse_admin.dart';
import 'mylib.dart' as mylib;

class AccueilGererLesMarkers extends StatefulWidget {
  const AccueilGererLesMarkers({super.key});

  @override
  State<AccueilGererLesMarkers> createState() => Accueilgererlesmarkers();
}

class Accueilgererlesmarkers extends State<AccueilGererLesMarkers> {
  Widget gererlesmarkersvalide() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GererMarkersRecuAdmin(),
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
          "accueil_gerer_les_markers_btn_validated".tr(),
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesmarkersrecu() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const TraiterMarkersRecuAdmin(),
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
          "accueil_gerer_les_markers_btn_traiter_received".tr(),
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesmarkersrefuse() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GererLesMarkersRefuse(),
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
          "accueil_gerer_les_markers_btn_rejected".tr(),
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
            height: 464,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 61),
                SizedBox(
                  width: 250,
                  child: Text('acceuil_gerer_les_markers_title'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 61),
                gererlesmarkersvalide(),
                const SizedBox(height: 30),
                gererlesmarkersrecu(),
                const SizedBox(height: 30),
                gererlesmarkersrefuse(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

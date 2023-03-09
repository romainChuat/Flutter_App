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
  
  Widget gererlesmarkersvalide(reponses) {
    
    return SizedBox(
      width: 285,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GererMarkersRecuAdmin(),
              settings: RouteSettings(arguments: reponses),
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
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesmarkersrecu(reponses) {
    return SizedBox(
      width: 285,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const TraiterMarkersRecuAdmin(),
              settings: RouteSettings(arguments: reponses),
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
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesmarkersrefuse(reponses) {
    return SizedBox(
      width: 285,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GererLesMarkersRefuse(),
              settings: RouteSettings(arguments: reponses),
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
            height: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: Text('acceuil_gerer_les_markers_title'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 50),
                gererlesmarkersvalide(reponses),
                const SizedBox(height: 20),
                gererlesmarkersrecu(reponses),
                const SizedBox(height: 20),
                gererlesmarkersrefuse(reponses),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

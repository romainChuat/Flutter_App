import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/recherche_page_admin.dart';
import 'traiter_avis_recu_admin.dart';
import 'gerer_les_avis_refuse_admin.dart';
import 'gerer_les_avis_valide_admin.dart';

import 'mylib.dart' as mylib;

class AccueilGererLesAvis extends StatefulWidget {
  const AccueilGererLesAvis({super.key});

  @override
  State<AccueilGererLesAvis> createState() => AccueilGererLesavis();
}

class AccueilGererLesavis extends State<AccueilGererLesAvis> {
  Widget gererlesavisvalide(reponses) {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const Recherchepage(),
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
          "accueil_gerer_les_avis_btn_validated".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesavisrecu(reponses) {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const TraiterAvisRecu(),
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
          "accueil_gerer_les_avis_btn_traiter_received".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesavisrefuse(reponses) {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GererAvisRefuse(),
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
          "accueil_gerer_les_avis_btn_rejected".tr(),
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
                  child: Text('accueil_gerer_les_avis_title'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 50),
                gererlesavisvalide(reponses),
                const SizedBox(height: 20),
                gererlesavisrecu(reponses),
                const SizedBox(height: 20),
                gererlesavisrefuse(reponses),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

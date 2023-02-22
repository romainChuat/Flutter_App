import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
  Widget gererlesavisvalide() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GererAvisValide(),
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
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesavisrecu() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const TraiterAvisRecu(),
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
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererlesavisrefuse() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GererAvisRefuse(),
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
                  child: Text('accueil_gerer_les_avis_title'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 61),
                gererlesavisvalide(),
                const SizedBox(height: 30),
                gererlesavisrecu(),
                const SizedBox(height: 30),
                gererlesavisrefuse(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

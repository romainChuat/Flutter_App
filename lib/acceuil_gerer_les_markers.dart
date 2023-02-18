import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'Traiter_markers_recu_admin.dart';
import 'gerer_les_markers_recu_admin_choisis.dart';
import 'gerer_markers_refuse_admin.dart';
import 'mylib.dart' as mylib;

class acceuilgererlesmarkers extends StatefulWidget {
  const acceuilgererlesmarkers({super.key});

  @override
  State<acceuilgererlesmarkers> createState() => _acceuilgererlesmarkers();
}

class _acceuilgererlesmarkers extends State<acceuilgererlesmarkers> {
  Widget GererLesMarkersValide() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const gerer_markers_recu_admin(),
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
          "acceuil_gerer_les_markers_btn_validated".tr(),
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget GererLesMarkersRecu() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const traiter_markers_recu_admin(),
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
          "acceuil_gerer_les_markers_btn_traiter_received".tr(),
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget GererLesMarkersRefuse() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const gerer_les_markers_refuse(),
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
          "acceuil_gerer_les_markers_btn_rejected".tr(),
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
             SizedBox(height: 61),
             SizedBox(
              width: 250,
              child: Text('acceuil_gerer_les_markers_title'.tr(),
                  style: mylib.titleStyle),
            ),
            const SizedBox(height: 61),
            GererLesMarkersValide(),
            const SizedBox(height: 30),
            GererLesMarkersRecu(),
            const SizedBox(height: 30),
            GererLesMarkersRefuse(),
            const SizedBox(height: 40),
          ],
        ),
      ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Traiter_avis_recu_admin.dart';
import 'gerer_les_avis_refuse_admin.dart';
import 'gerer_les_avis_validé_admin.dart';

import 'mylib.dart' as mylib;

class acceuilgererlesavis extends StatefulWidget {
  const acceuilgererlesavis({super.key});

  @override
  State<acceuilgererlesavis> createState() => _acceuilgererlesavis();
}

class _acceuilgererlesavis extends State<acceuilgererlesavis> {
  Widget GererLesAvisValide() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const gerer_avis_valide(),
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
          "Gérer les avis validé",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget GererLesAvisRecu() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const traiter_avis_recu(),
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
          "Traiter les avis reçu",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget GererLesAvisRefuse() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const gerer_avis_refuse(),
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
          "Gérer les avis refusé",
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
            const SizedBox(height: 61),
            const SizedBox(
              width: 250,
              child: Text('Vous avez choisis de gérer les avis.',
                  style: mylib.titleStyle),
            ),
            const SizedBox(height: 61),
            GererLesAvisValide(),
            const SizedBox(height: 30),
            GererLesAvisRecu(),
            const SizedBox(height: 30),
            GererLesAvisRefuse(),
            const SizedBox(height: 40),
          ],
        ),
      ),
       ),
      ),
    );
  }
}

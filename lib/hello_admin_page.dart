import 'package:flutter/material.dart';
import 'acceuil_gerer_les avis.dart';
import 'acceuil_gerer_les_markers.dart';
import 'mylib.dart' as mylib;

class hello_admin_page extends StatefulWidget {
  const hello_admin_page({super.key});

  @override
  State<hello_admin_page> createState() => _hello_admin_page();
}

class _hello_admin_page extends State<hello_admin_page> {
  Widget GererLesMarkers() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const acceuilgererlesmarkers(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Gérer les markers",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget GererLesAvis() {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const acceuilgererlesavis(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Gérer les avis",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              child: const Text('Hello, Admin', style: mylib.titleStyle2),
            ),
            const SizedBox(height: 61),
            Container(
              width: 250,
              child: const Text(
                  'Veuillez choisir ce que vous souhaitez réaliser.',
                  style: mylib.titleStyle),
            ),
            const SizedBox(height: 61),
            GererLesMarkers(),
            const SizedBox(height: 30),
            GererLesAvis(),
            const SizedBox(height: 61),
          ],
        ),
      ),
    );
  }
}

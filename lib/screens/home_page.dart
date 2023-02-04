import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 80,
              ),
              alignment: Alignment.center,
              child: Text(
                'Kusoo dhowow Casri Online Shop',
                style: GoogleFonts.roboto(fontSize: 19, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 230,
                width: 230,
                child: ClipOval(
                    child: Image.network(
                  'https://images.pexels.com/photos/4392030/pexels-photo-4392030.jpeg?auto=compress&cs=tinysrgb&w=600',
                  fit: BoxFit.cover,
                ))),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Adeego Meel walboo aad joogto',
                  style: GoogleFonts.aboreto(fontSize: 15, color: Colors.black),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (() {
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: Text('Casri Shop'),
                  // ignore: prefer_const_constructors
                  content: Text(
                      'waa dukaan casri ah oo kuu fududeynaya inaad si online ah uga adeegato adigoo gurigaaga ama goobtaada shaqada joogto waana aamin'),
                  actions: [
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        child: const Text('Ok'))
                  ],
                );
              }));
        }),
        child: const Icon(FontAwesomeIcons.infoCircle),
      ),
    );
  }
}

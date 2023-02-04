// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 20, top: 70),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Casri Shop waa saaxiibka macaamiisha',
              style: GoogleFonts.acme(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              'ammaano iyo adeeg deg deg ah',
              style: GoogleFonts.aboreto(),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.only(left: 65),
            child: Row(
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Nagala soo xiriir: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                      TextSpan(
                        text: ' 6545',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' ama',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' 4568',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ])),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.only(left: 65),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.envelope),
                SizedBox(
                  width: 10,
                ),
                Text('casrishop@email.com'),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            margin: const EdgeInsets.only(left: 65),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.facebook),
                const SizedBox(
                  width: 10,
                ),
                const Text('CasriShop/facebook.com'),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.only(left: 65),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.whatsapp),
                const SizedBox(
                  width: 10,
                ),
                Text('WhatsApp 618255984'),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            margin: const EdgeInsets.only(left: 65),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.phone),
                const SizedBox(
                  width: 10,
                ),
                const Text('Call 618255984'),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

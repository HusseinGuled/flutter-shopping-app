// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Registrate extends StatefulWidget {
  const Registrate({super.key});

  @override
  State<Registrate> createState() => _RegistrateState();
}

class _RegistrateState extends State<Registrate> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  final auth = FirebaseAuth.instance;

  GoogleSignIn _GoogleSignIn = GoogleSignIn();

  register() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: username.text, password: password.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('welcome! registrated successfully')));
      Navigator.of(context);
      Navigator.pop(context);
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(err.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 160,
              width: 160,
              margin: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 2, color: Colors.blue)),
              child: const Icon(
                Icons.person_add,
                size: 130,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 50,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: username,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'UserName',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 250,
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: register, child: const Text('Register')),
            const SizedBox(
              height: 10,
            ),
            SignInButton(Buttons.googleDark, onPressed: () {
              _GoogleSignIn.signIn().then((value) => ((value) {
                    var user = value!.displayName!;
                    String prof = value!.photoUrl!;
                  }));
            }, text: 'Sign with Google')
          ],
        ),
      ),
    ));
  }
}

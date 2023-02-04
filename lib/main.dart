import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/firebase_options.dart';
import 'screens/contact_page.dart';
import 'screens/home_page.dart';
import 'screens/login.dart';
import 'screens/shop_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Casri Electronic Shop',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 23),
          ),
          centerTitle: true,
          bottom: const TabBar(
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicator: BoxDecoration(),
              tabs: [
                Icon(Icons.home),
                Icon(
                  FontAwesomeIcons.shoppingBag,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.phone,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.userPlus,
                  size: 20,
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            const HomePage(),
            const ShopPage(),
            const ContactPage(),
            Login(),
          ],
        ),
      ),
    );
  }
}

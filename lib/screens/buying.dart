// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/screens/shop_page.dart';

class BuiyinScreen extends StatefulWidget {
  BuiyinScreen({super.key, required this.totalMoney, required this.items});
  double totalMoney;
  List items = [];

  @override
  State<BuiyinScreen> createState() => _BuiyinScreenState();
}

class _BuiyinScreenState extends State<BuiyinScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController adderss = TextEditingController();
  TextEditingController streat = TextEditingController();
  TextEditingController house_no = TextEditingController();
  final store = FirebaseFirestore.instance;
  sendToStore() async {
    try {
      await store.collection('purchisedInfo').add({
        'customerName': name.text,
        'email': email.text,
        'phone': phone.text,
        'address': adderss.text,
        'streat': streat.text,
        'house_no': house_no.text,
        'totalPrice': widget.totalMoney,
        'items': widget.items
      });
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 20,
                  top: 70,
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'fullname is required';
                    }
                  },
                  controller: name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'FullName',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is required';
                    }
                  },
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'phone number is required';
                    }
                  },
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'address is required';
                    }
                  },
                  controller: adderss,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    hintText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(19)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'streat is required';
                    }
                  },
                  controller: streat,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_axis_outlined),
                    hintText: 'Streat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20, top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'house number is required';
                    }
                  },
                  controller: house_no,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.house_outlined),
                    hintText: 'House No',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20, top: 10),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: widget.totalMoney.toString(),
                    prefixIcon: Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: (() {
                    if (_formKey.currentState!.validate() &&
                        widget.totalMoney > 0) {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: Text('Wax iisbi'),
                              content: Text(
                                  'ma hubtaa inaad \$${widget.totalMoney} wax uga iibsato Casri Shop?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  'wax iibsgaaga ma guuleysan fadlan isku day markale')));
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      sendToStore();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  'waad ku mahadsan tahay wax iibsigaaga adeegaaga sida ugu dhakhsiyaha badan baa laguugu keeni doonaa i.a')));
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok')),
                              ],
                            );
                          }));
                    } else if (_formKey.currentState!.validate() &&
                        widget.totalMoney == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'si aad wax u iibsato marka hore wax soo dooro')));
                    }
                  }),
                  child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}

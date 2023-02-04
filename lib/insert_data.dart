import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Insert extends StatefulWidget {
  Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  TextEditingController itemName = TextEditingController();

  TextEditingController itemPrice = TextEditingController();

  TextEditingController itemDescription = TextEditingController();

  TextEditingController itemImg = TextEditingController();

  final store = FirebaseFirestore.instance;

  void save() async {
    try {
      await store.collection('Product').add({
        'itemName': itemName.text,
        'itemPrice': itemPrice.text,
        'itemDescription': itemDescription.text,
        'itemImg': itemImg.text
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('inserted successfully')));
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: itemName,
            decoration: InputDecoration(
                hintText: 'ItemName', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: itemPrice,
            decoration: InputDecoration(
                hintText: 'ItemPrice', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: itemDescription,
            decoration: InputDecoration(
                hintText: 'ItemDescription', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: itemImg,
            decoration: InputDecoration(
                hintText: 'ItemImage', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: save, child: Text('Save'))
        ],
      ),
    );
  }
}

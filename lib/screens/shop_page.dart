// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/products.dart';
import 'package:shop_app/screens/buying.dart';
import '../resuables/reuseable_card.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final data = FirebaseFirestore.instance.collection('Product').snapshots();
  double totalPrice = 0;
  List items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFfafafa),
        elevation: 0,
        actions: [
          Container(
              margin: EdgeInsets.only(right: 30, top: 20),
              child: Text(
                '\$ ${totalPrice.toStringAsFixed(1)}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ))
        ],
      ),
      body: StreamBuilder(
          stream: data,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var keyd = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: keyd.length,
                  itemBuilder: ((context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12,
                            ),
                            height: 110,
                            child: Row(
                              children: [
                                Container(
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.only(
                                  //   bottomLeft: Radius.circular(14),
                                  // )),
                                  width: 120,
                                  height: 110,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      keyd[index]['itemImg'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      keyd[index]['itemName'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width: 170,
                                        child: Text(
                                          keyd[index]['itemDescription'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '\$${keyd[index]['itemPrice']}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onDoubleTap: (() {
                                    setState(() {
                                      if (totalPrice > 0 &&
                                          totalPrice >=
                                              keyd[index]['itemPrice']) {
                                        totalPrice -= keyd[index]['itemPrice'];
                                        items.remove(keyd[index]['itemName']);
                                      }
                                      totalPrice = totalPrice;
                                    });
                                  }),
                                  child: IconButton(
                                      onPressed: (() {
                                        setState(() {
                                          totalPrice +=
                                              keyd[index]['itemPrice'];
                                          items.add(keyd[index]['itemName']);
                                        });
                                      }),
                                      icon: Icon(
                                        Icons.favorite_outline,
                                        color: Colors.black,
                                        size: 37,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          })),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          onPressed: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BuiyinScreen(
                          totalMoney: totalPrice,
                          items: items,
                        )));
          }),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                Icon(Icons.shopping_bag_outlined),
                Container(
                    margin: EdgeInsets.only(left: 5, bottom: 0),
                    child: Text('Buy Now')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

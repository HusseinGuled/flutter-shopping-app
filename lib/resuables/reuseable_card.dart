import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/products.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {super.key,
      required this.itemName,
      required this.itemImg,
      required this.itemPrice});
  String itemName, itemImg;
  int itemCount = 0;
  int itemPrice;
  // Products prod = new Products();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 210,
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.blue)),
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 170,
            child: Image.network(
              itemImg,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(itemName),
          SizedBox(
            height: 3,
          ),
          Text('\$' + itemPrice.toString()),
          SizedBox(
            height: 1,
          ),
          // Text(itemDescription),

          Container(
            margin: EdgeInsets.only(top: 5),
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3, left: 2),
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 45, top: 7),
                      child: Text(
                        itemCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 60),
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

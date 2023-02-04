import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/products.dart';

class CartsPage extends StatefulWidget {
  CartsPage({
    super.key,
  });

  // String itemImg, itemName;
  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  Products obj = new Products();
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: ListView(children: [
        //   Container(
        //     margin: EdgeInsets.all(10),
        //     padding: EdgeInsets.all(10),
        //     decoration:
        //         BoxDecoration(border: Border.all(width: 2, color: Colors.blue)),
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 200,
        //           child: Image.network(
        //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXzDqLfiweKJnceX1dyTuNXbo59MwViYRk4g&usqp=CAU',
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //         SizedBox(
        //           width: 15,
        //         ),
        //         SizedBox(
        //           width: 30,
        //           child: TextButton(
        //               style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.blue)),
        //               onPressed: (() {}),
        //               child: Text(
        //                 '-',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.w700,
        //                   fontSize: 19,
        //                 ),
        //               )),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Text('1'),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         SizedBox(
        //           width: 30,
        //           child: TextButton(
        //               style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.blue)),
        //               onPressed: (() {}),
        //               child: Text(
        //                 '+',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.w700,
        //                   fontSize: 19,
        //                 ),
        //               )),
        //         ),
        //         SizedBox(
        //           width: 15,
        //         ),
        //         TextButton(
        //             style: ButtonStyle(
        //                 backgroundColor: MaterialStateProperty.all(Colors.red)),
        //             onPressed: (() {}),
        //             child: Text(
        //               'Delete',
        //               style: TextStyle(
        //                 color: Colors.white,
        //               ),
        //             )),
        //       ],
        //     ),
        //   )
        // ]),
        body: StreamBuilder(
            stream: obj.data(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Center(child: Text('data'));
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.data.toString()));
              }
              return Center(child: CircularProgressIndicator());
            })));
  }
}

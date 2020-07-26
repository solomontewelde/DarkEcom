import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dark_up/Utilities/OrdersModel.dart';

class MyBagScreen extends StatefulWidget {
  @override
  _MyBagScreenState createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
   List<MyOrders> orders = [
    MyOrders(name:'PINK WOMEN DRESS',size:'M',color:Colors.pinkAccent,img:'assets/dresses/pink_dress.png',price:500),
    MyOrders(name:'BLUE WOMEN DRESS',size:'S',color:Color(0xff22316C),img:'assets/dresses/blue_dress.png',price:300),
   ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY BAG',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 0.0,
            child: _bagItem(orders[index]),
          );
        },
      ),
    );
  }
  Widget _bagItem(MyOrders order) {
    String name = order.name;
    String size = order.size;
    Color color = order.color;
    String image = order.img;
    int price = order.price;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Color(0xffF5F5F5),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('$name',
                    style: TextStyle(
                        fontSize: 18,
                        color:Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text('SIZE: $size',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffB8B8B8),
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Text('COLOR:',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffB8B8B8),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 10,
                      width: 14,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text('$price',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('AED',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1)),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 130,
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: DecoratedBox(
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: FlatButton(
                                padding: EdgeInsets.only(left: 4),
                                onPressed: () {
                                  setState(() {
                                   order.quantity = order.quantity-1;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                    color: Colors.white,
                                    height: double.infinity,
                                    child: Center(
                                        child: Text('${order.quantity}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18))))),
                            Expanded(
                              flex: 2,
                              child: FlatButton(
                                padding: EdgeInsets.only(right: 4),
                                onPressed: () {
                                  setState(() {
                                    order.quantity = order.quantity+1;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffE8E8E8),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
                child: Image.asset('$image',width: 145,height: 150,fit: BoxFit.fill,)),
          ],
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


class PromotionWidget{
  static Widget promotionWidget({String couponCode,int percentOff}) {
    return DottedBorder(
      dashPattern: [2, 15],
      strokeWidth: 4,
      strokeCap: StrokeCap.square,
      borderType: BorderType.Rect,
      radius: Radius.circular(5),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
        height: 80,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'USE COUPON CODE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              child: DottedBorder(
                dashPattern: [5, 3],
                strokeWidth: 1,
                strokeCap: StrokeCap.square,
                borderType: BorderType.Rect,
                color: Colors.white,
                radius: Radius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    '$couponCode',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Text(
              'AND GET $percentOff% OFF',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


}

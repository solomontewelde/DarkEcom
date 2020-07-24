import 'package:dark_up/Custom_Widgets/PromotionWidget.dart';
import 'package:flutter/material.dart';
import 'package:dark_up/Custom_Widgets/PromotionWidget.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final int _percentOff = 20;
  final String _couponCode = 'MVP20';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PromotionWidget.promotionWidget(couponCode: _couponCode,percentOff: _percentOff),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => print('Summer sale tapped'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/summer_sale.png',
                  width: double.maxFinite,
                  height: 240,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => print('New arrivals tapped'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        'assets/new_arrivals.png',
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => print('Shop by brand taped'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        'assets/shop_by_brand.png',
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => print('Red dress tapped'),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset('assets/new_dress.png',
                      width: double.infinity, height: 400, fit: BoxFit.fill),
                  Text('Best seller',
                      style: TextStyle(
                          backgroundColor: Colors.red,
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => print('Women bags'),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset('assets/new_women_bags.png',
                      width: double.infinity, height: 150, fit: BoxFit.fill),
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                      color: Colors.white,
                      child: Text('NEW WOMEN BAGS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}

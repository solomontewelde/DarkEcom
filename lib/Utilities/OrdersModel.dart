import 'package:flutter/material.dart';

class MyOrders{
  String name;
  String size;
  Color color;
  String img;
  int price;
  int _quantity = 1;

  MyOrders({this.name, this.size, this.color, this.img, this.price});

  set quantity(int value) {
    if(value<0){
      _quantity = 0;
    }
    else{
      _quantity = value;
    }

  }

  int get quantity => _quantity;
}
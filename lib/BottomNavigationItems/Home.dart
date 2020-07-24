import 'package:dark_up/Screens/HomePageContent.dart';
import 'package:flutter/material.dart';
import 'package:dark_up/Custom_Widgets/DarkAppBar.dart';
import 'package:dotted_border/dotted_border.dart';

class HomeScreen extends StatefulWidget {
  //TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 28)
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(),
      body: HomePageContent(),
    );
  }
}

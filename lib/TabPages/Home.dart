import 'package:flutter/material.dart';

class HomeTabPageContent extends StatefulWidget {
  @override
  _HomeTabPageContentState createState() => _HomeTabPageContentState();
}

class _HomeTabPageContentState extends State<HomeTabPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'HOME SECTION',
        style: TextStyle(
          fontSize: 40,

        ),),
    );
  }
}

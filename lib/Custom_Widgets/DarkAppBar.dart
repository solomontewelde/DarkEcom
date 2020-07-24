import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class DarkAppBar extends StatefulWidget implements PreferredSizeWidget {
  DarkAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  // TODO: implement preferredSize
  final Size preferredSize;

  @override
  _DarkAppBarState createState() => _DarkAppBarState();

}

class _DarkAppBarState extends State<DarkAppBar> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black87, //or set color with: Color(0xFF0000FF)
    ));
    return  AppBar(
      leading: IconButton(
        icon:Icon(Icons.sort,
        color: Colors.black,),
      ),
      title: Image.asset('assets/dark_logob.png',height: 25, width: 115,fit: BoxFit.fill,),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.4,
    );
  }

}

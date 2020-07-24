import 'package:flutter/material.dart';
import 'package:dark_up/Custom_Widgets/TabbedAppBar.dart';
import 'package:dark_up/Utilities/ConstantsValues.dart';
import 'package:dark_up/TabPages/Women.dart';
import 'package:dark_up/TabPages/Men.dart';
import 'package:dark_up/TabPages/Kids.dart';
import 'package:dark_up/TabPages/Home.dart';
class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  static List<Widget> _tabContents = [
    MenTabPageContent(),
    WomenTabPageContent(),
    KidsTabPageContent(),
    HomeTabPageContent(),
  ];
  @override
  Widget build(BuildContext context) {
     int _numOfTabs = 4;
     int initialTabIndex = Constants.WOMEN_TAB;

    return DefaultTabController(
      initialIndex: initialTabIndex,
      length: _numOfTabs,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: CustomTabbedAppbar.tabbedAppbar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _tabContents,
        ),
      ),
    );
  }



}

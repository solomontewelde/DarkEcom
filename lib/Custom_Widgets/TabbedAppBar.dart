import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class CustomTabbedAppbar {
  static PreferredSize tabbedAppbar() {
    List<Widget> _tabs = [
      _tab("MEN"),
      _tab("WOMEN"),
      _tab("KIDS"),
      _tab("HOME"),
    ];
    return PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'SEARCH..',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 2),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(220)),
                    ),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      indicator: BubbleTabIndicator(
                          indicatorHeight: 30.0,
                          indicatorRadius: 18,
                          tabBarIndicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.black),
                      tabs: _tabs,
                    ),
                  ),
                ],
              ),
            )));
  }
  static Widget _tab(String tabLabel) {
    return Tab(
        child: Text('$tabLabel',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)));
  }

}












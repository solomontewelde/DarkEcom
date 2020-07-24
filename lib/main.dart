import 'package:dark_up/BottomNavigationItems/Categories.dart';
import 'package:dark_up/BottomNavigationItems/WishList.dart';
import 'package:dark_up/BottomNavigationItems/MyBag.dart';
import 'package:dark_up/BottomNavigationItems/Profile.dart';
import 'package:dark_up/BottomNavigationItems/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomBottomNavigationBar(),
  ));
}

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> _routes = [
    HomeScreen(),
    WishListScreen(),
    CategoryScreen(),
    MyBagScreen(),
    ProfileScreen()
  ];
  List<BottomNavigationBarItem> _bottomNavigationItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      title: Text('Wish list'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text('Categories'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket),
      title: Text('My bag'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Profile'),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routes[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        iconSize: 35,
        showUnselectedLabels: true,
        unselectedFontSize: 10,
        unselectedLabelStyle: TextStyle(color: Colors.black45),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        items: _bottomNavigationItems,
      ),
    );
  }
  Widget _buildBody() {
    // return a widget representing a page

  }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


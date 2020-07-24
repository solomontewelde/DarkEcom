import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dark_up/Utilities/DressModel.dart';
import 'package:dark_up/Utilities/ImageFiles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dark_up/Utilities/MySharedPrefManager.dart';

class DressesGridView extends StatefulWidget {
  @override
  _DressesGridViewState createState() => _DressesGridViewState();
}

class _DressesGridViewState extends State<DressesGridView> {
  Icon _icon;
  static List<String> data = MyImages.imagePaths;
  List<bool> _isFavorite = List<bool>.generate(data.length, (_) => false);
  List<DressModel> dresses = [
    DressModel('d1', 'BLUE WOMEN DRESS', '129'),
    DressModel('d2', 'BLACK PEACH DRESS', '789'),
    DressModel('d3', 'PINK WOMEN DRESS Dress', '429'),
    DressModel('d4', 'WEIRED DRESS', '350'),
    DressModel('d5', 'COLORFUL DRESS', '329'),
    DressModel('d6', 'SHORT RED DRESS', '189'),
    DressModel('d7', 'Red-ISH DRESS', '500'),
    DressModel('d8', 'CASUAL BROWN DRESS', '200'),
    DressModel('d9', 'MAROON FORMAL DRESS', '350'),
    DressModel('d10', 'Red DRESS', '350'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getDressesAppbar(context),
      body: _dressesGridView(),
    );
  }

  @override
  void initState() {
    // _icon = Icon(Icons.favorite_border);
  }

  Widget _dressesGridView() {
    var size = MediaQuery.of(context).size;
    const int NOTIFICATIONBAR_HEIGHT = 24;
    final double itemHeight =
        (size.height - kToolbarHeight - NOTIFICATIONBAR_HEIGHT) / 2;
    final double itemWidth = size.width / 2;
    Orientation orientation = Orientation.portrait;

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (itemWidth / itemHeight),
          mainAxisSpacing: 20,
          crossAxisSpacing: 25,
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => print('$index'),
          child: Stack(
            children: <Widget>[
              Card(
                child: new GridTile(
                  header: Text('$index'),
                  footer: Text(
                    'AED ${dresses[index].price}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: Image.asset(data[index]),
                ),
              ),
              IconButton(
                onPressed: ()  {
                  setState(()  {
                    setIcon(index);
                  });
                },
                icon: _icon !=null  ? _icon: Icon(Icons.favorite_border) ,
              ),
            ],
          ),
        );
      },
    );
  }
   setIcon(int index)async{
    _icon = await toggleFavButton(index);

  }
  Future<Icon> toggleFavButton(int index) async {
    String key = dresses[index].id;
    bool isPresent = await MySharedPreferenceManager.isValuePresent(key);
    if (isPresent) {
      print('$index disLiked');
      MySharedPreferenceManager.removePreference(key);
      return Icon(
        Icons.favorite_border,
        color: Colors.black,
      );
    } else {
      print('$index Liked');
      MySharedPreferenceManager.savePreference(key, dresses[index].id);
      return Icon(
        Icons.favorite,
        color: Colors.black,
      );
    }
  }

/*
  Uint8List loadImages(int index) {
    StorageReference photoRef =
        FirebaseStorage.instance.ref().child("Dress_Photos");
    String photoPath = "d$index.jpg";
    photoRef.child(photoPath).getData(7).then((data) {
      return data;
    }).catchError((error) => print("$error"));
  }
*/

  PreferredSizeWidget _getDressesAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.filter_list),
          color: Colors.black,
        ),
      ],
      title: Text(
        'DRESSES',
        style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w900),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
    );
  }
}

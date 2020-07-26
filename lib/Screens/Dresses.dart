import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dark_up/Utilities/DressModel.dart';
import 'package:dark_up/Utilities/ImageFiles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dark_up/Utilities/MySharedPrefManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_up/Utilities/FavoritesHandler.dart';

class DressesGridView extends StatefulWidget {
  @override
  _DressesGridViewState createState() => _DressesGridViewState();
}

class _DressesGridViewState extends State<DressesGridView> {
 List<String> _isFavorite=[];

  @override
  Widget build(BuildContext context) {
    loadSharedPreferences();
    return Scaffold(
      appBar: _getDressesAppbar(context),
      body: _dressesGridView(),
    );
  }

  Future<Null>loadSharedPreferences()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     dynamic keys = preferences.getKeys();
     List<String>isFavorite=[];
     for(String key in keys){
       isFavorite.add(key);
        }
     _isFavorite = isFavorite;
    print('Number of liked items: ${_isFavorite.length}');
  }


  Widget _dressesGridView() {
    var size = MediaQuery.of(context).size;
    const int NOTIFICATIONBAR_HEIGHT = 24;
    final double itemHeight =
        (size.height - kToolbarHeight - NOTIFICATIONBAR_HEIGHT) / 2;
    final double itemWidth = size.width / 1.8;
    Orientation orientation = Orientation.portrait;

    return StreamBuilder(
      stream: Firestore.instance.collection('Dress').snapshots(),
      builder: (context,snapshot){
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
          itemCount: snapshot.data.documents.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (itemWidth / itemHeight),
              mainAxisSpacing: 20,
              crossAxisSpacing: 25,
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot dress = snapshot.data.documents[index];
            return GestureDetector(
              onTap: () => print('$index'),
              child: Stack(
                children: <Widget>[
                  Card(
                    child: new GridTile(
                      footer: Text(
                        'AED ${dress['price']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: dress['image']!=''?Image.network(dress['image'],fit: BoxFit.fill,):
                      CircularProgressIndicator(backgroundColor:Colors.black,),
                    ),
                  ),
                  IconButton(
                    onPressed: () async{
                       await FavoritesHandler.toggleFavButton(dress['image']); //using dress['image'] string as key for testing
                       setState((){}); //required
                    },
                    icon: _isFavorite.contains(dress['image'])?Icon(Icons.favorite,size: 35,):Icon(Icons.favorite_border,size: 35,) ,
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }



  Future<void> isLiked(String uid) async{
    Future<DocumentSnapshot> documentSnapShot = Firestore.instance.collection('Favorites').document().get();
    DocumentSnapshot doc = await documentSnapShot;
    print('Solomon liked: ${doc['solomon']!=null}');
  }

  Future<DocumentSnapshot> fetchInfo(String item) async{
       Future<DocumentSnapshot> docSnapshot = Firestore.instance.collection('Dress').document('info').get();
       DocumentSnapshot doc = await docSnapshot;
       print('////////////////// ${doc['$item']}');

  }

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

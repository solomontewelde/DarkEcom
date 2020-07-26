import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_up/Custom_Widgets/DarkAppBar.dart';
import 'package:flutter/material.dart';
import 'package:dark_up/Custom_Widgets/DefaultAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dark_up/Utilities/FavoritesHandler.dart';
class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'WISHLIST',),
      body:DressImagesGrid(), //ImageGrid(),
    );
  }
}

class DressImagesGrid extends StatefulWidget {

  @override
  _DressImagesGridState createState() => _DressImagesGridState();

}

class _DressImagesGridState extends State<DressImagesGrid> {
   List<String> _isFavorite=[];
    @override
  Widget build(BuildContext context) {
      loadSharedPreferences();
    return _dressesGridView();
  }
  Widget _dressesGridView() {
      loadSharedPreferences();
    var size = MediaQuery.of(context).size;
    const int NOTIFICATIONBAR_HEIGHT = 24;
    final double itemHeight =
        (size.height - kToolbarHeight - NOTIFICATIONBAR_HEIGHT) / 2;
    final double itemWidth = size.width / 1.8;
    Orientation orientation = Orientation.portrait;
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
          itemCount: _isFavorite.length,
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
                      footer: Text(
                        'AED ${599}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: Image.network(_isFavorite[index],fit: BoxFit.fill,)

                    ),
                  ),
                  IconButton(
                    onPressed: () async{
                      await FavoritesHandler.toggleFavButton(_isFavorite[index]); //using dress['image'] string as key for testing
                      setState((){}); //required
                    },
                    icon: _isFavorite.contains(_isFavorite[index])?Icon(Icons.favorite,size: 35,):Icon(Icons.favorite_border,size: 35,) ,
                  ),
                ],
              ),
            );
          },
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
}

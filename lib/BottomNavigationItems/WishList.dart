import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_up/Custom_Widgets/DarkAppBar.dart';
import 'package:flutter/material.dart';
import 'package:dark_up/Custom_Widgets/DefaultAppBar.dart';
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
  @override
  Widget build(BuildContext context) {
    return _dressesGridView();
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
          itemCount: snapshot.data.documents.length, //TODO IF handle document based on status of the stream //doc could be null
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
                      child: dress['image']!=null?Image.network(dress['image'],fit: BoxFit.fill,)
                          :CircularProgressIndicator(backgroundColor: Colors.black,value: 20,),
                    ),
                  ),
                  IconButton(
                    onPressed: ()  {
                      setState(()  {
                      });
                    },
                    icon: Icon(Icons.favorite_border,size: 35,) ,
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }
}

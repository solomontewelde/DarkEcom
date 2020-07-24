import 'package:dark_up/Screens/Dresses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clothing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'CLOTHING',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w900),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: _clothingBody(),
          ),
        ],
      ),
    );
  }

  Widget _clothingBody() {
    List<String> listItems = [
      'NEW IN',
      'JEANS',
      'JACKET',
      'SHIRTS',
      'POLO SHIRTS',
      'SHORTS',
      'DRESSES',
      'T-SHIRTS',
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 30, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'SHOP BY PRODUCT',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              padding: EdgeInsets.only(left: 4.0),
              itemCount: listItems.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DressesGridView()));
                  },
                  title: Text(
                    '${listItems[index]}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        fontSize: 15.0),
                  ),
                  trailing: Icon(Icons.navigate_next),
                );
              }),
        ],
      ),
    );
  }
}

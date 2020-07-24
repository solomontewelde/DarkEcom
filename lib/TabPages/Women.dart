import 'file:///C:/Users/100043392/AndroidStudioProjects/dark_up/lib/BottomNavigationItems/Home.dart';
import 'package:dark_up/Screens/Clothing.dart';
import 'package:flutter/material.dart';


class WomenTabPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _womenTabPage();
  }


  Widget _womenTabListItem({String label, String image}) {
    Color listItemColor = Color(0xffEEEEEE);
    TextStyle onSaleBannerStyle = TextStyle(
      color: Colors.white,
      letterSpacing: 0.5,
      fontSize: 15,
      fontWeight: FontWeight.w900,
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: label=="ON SALE"?Color(0xffcc0000):listItemColor,
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  '$label',
                  style: (label=="ON SALE")?onSaleBannerStyle:TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(20, 120),
                  bottomLeft: Radius.elliptical(20, 120),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: Image.asset(
                  'assets/$image',
                  width: 200,
                  height: 115,
                  fit: BoxFit.fill,
                )),
          ),
        ],
      ),
    );
  }

  Widget _womenTabPage(){
    List <Widget> _tabViewItem = [
      _womenTabListItem(label: "ON SALE", image: "offer.png"),
      _womenTabListItem(label: "DESIGNERS", image: "designers.png"),
      _womenTabListItem(label: "BRANDS", image: "brands.png"),
      _womenTabListItem(label: "CLOTHING", image: "clothing.png"),
      _womenTabListItem(label: "SHOES", image: "shoes.png"),
    ];
    return Container(
      margin: EdgeInsets.fromLTRB(8,15,8,0),
      child: ListView.builder(
          itemCount:_tabViewItem.length,
          itemBuilder: (context,index) {
            return GestureDetector(
              onTap: (){
                switch(index){
                  case 0: {

                  };break;
                  case 1: {};break;
                  case 2: {};break;
                  case 3: {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Clothing()),
                    );
                  };break;
                  case 4: {};break;
                  case 5: {};break;

                }

              },
              child: Card(
                elevation: 0.0,
                borderOnForeground: false,
                child:Column(
                  children: <Widget>[
                    _tabViewItem[index],
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            );

          }
      ),
    );

  }
}







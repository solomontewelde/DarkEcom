import 'package:dark_up/Custom_Widgets/DefaultAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Color(0xffF5F5F5),
      appBar: DefaultAppBar(title: 'MY PROFILE'),
      body: _profileBody(screenSize: screenSize),
    );
  }

  _profileBody({Size screenSize}) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: screenSize.height / 4.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgr3.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: ((screenSize.height / 5) - 40),
                ), //profile background img size - 65
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/profile_pic.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(60.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            )
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text('WELCOME,\n  PANDA',style: TextStyle(fontSize:12,fontWeight: FontWeight.w900,letterSpacing: 0.5),)
                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
        SizedBox(height: 4,),
_profileOptionsList(screenSize),
     //   _profileOptionsList(screenSize),
      ],
    );
  }
  Widget _profileOptionsList(Size screenSize){
    List<String> items1 =[
      'MY ORDERS',
      'MY WISHLIST',
      'MY WALLET',
      'MY ADDRESSES',
    ];
    List<String> items2 =[
      'CHANGE LANGUAGE',
      'SUPPORT',
      'CURRENCY',
      'LOGOUT',
    ];

    return Container(
      child:Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.card_giftcard,),
                onPressed: () => {},
              ),
              Text('${items1[0]}',style: TextStyle(fontWeight: FontWeight.w900,),),
            ],
          ),
          Divider(color: Colors.black,)
        ],
      ),
    );

/*
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items1.length,
      itemBuilder: (BuildContext context,int index){
        return Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.card_giftcard,),
                onPressed: () => {},
              ),
              Text('${items1[index]}',style: TextStyle(fontWeight: FontWeight.w900,),),
              Divider(thickness: 2,height: 10,color: Colors.black,)
            ],
          ),
        );
      },

    );*/

  }
}

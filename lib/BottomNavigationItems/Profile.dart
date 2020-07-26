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
      backgroundColor:  Color(0xffF0F0F0),
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
                  image: AssetImage('assets/bgr.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: ((screenSize.height / 6) - 40),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 120,
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
                      Text('WELCOME,',style: TextStyle(fontSize:12,fontWeight: FontWeight.w900,letterSpacing: 0.5),),
                      Text('MASTER SHIFU',style: TextStyle(fontSize:12,fontWeight: FontWeight.w900,letterSpacing: 0.5),)
                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
        SizedBox(height: 4,),
        _profileOptionsList(screenSize),
      ],
    );
  }
  Widget _profileOptionsList(Size screenSize){

    return Column(
      children: <Widget>[
        Container(
          height: 132,
          child: Flex(
            direction: Axis.vertical,
                children: <Widget>[
                  Expanded(flex: 1,
                    child: _profileListItems(iconData:Icons.card_giftcard,text: 'MY ORDERS'),
                  ),
                  Expanded(flex: 1,
                    child: _profileListItems(iconData: Icons.favorite,text: 'MY WISHLIST'),
                  ),
                  Expanded(flex: 1,
                    child: _profileListItems(iconData: Icons.account_balance_wallet,text: 'MY WALLET') ,
                  ),



                  Expanded(flex: 1,
                    child: _profileListItems(iconData:Icons.location_on,text: 'MY ADDRESSES') ,
                  ),
                ],

          ),



        ),
        SizedBox(height: 28,),
        Container(
          height: 132,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(flex: 1,
                child: _profileListItems(iconData:Icons.language,text: 'CHANGE LANGUAGE'),
              ),
              Expanded(flex: 1,
                child: _profileListItems(iconData: Icons.email,text: 'SUPPORT') ,
              ),

              Expanded(flex: 1,
                child: _profileListItems(iconData: Icons.monetization_on,text: 'CURRENCY'),
              ),

              Expanded(flex: 1,
                child: _profileListItems(iconData:Icons.power_settings_new,text: 'LOGOUT') ,
              ),
            ],

          ),
        ),
      ],
    );



  }

  Widget _profileListItems({IconData iconData, String text}){
    return ListTile(

      onTap: (){
        if(text==text) print('My orders');
       if(text=='MY WISHLIST')print('My WISHLIST selected');
        if(text=='MY WALLET')print('My WALLET selected');
        if(text=='MY ADDRESSES')print('My ADDRESSES selected');
        if(text=='CHANGE LANGUAGE')print('CHANGE LANGUAGE');
        if(text=='SUPPORT')print('SUPPORT');
        if(text=='CURRENCY')print('CURRENCY');
        if(text=='LOGOUT')print('LOGOUT');
  },
      dense: true,
      leading:  Icon(iconData,color: Colors.black,),
      title: Align(
        child: new Text('$text', style: TextStyle(color:Colors.black,fontWeight:FontWeight.w900,fontSize: 12),),
        alignment: Alignment(-1.2, 0),
      ),
      trailing: Icon(Icons.navigate_next,color: Colors.black,),
    );

  }


}

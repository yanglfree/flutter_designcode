import 'package:flutter/material.dart';
import 'package:my_app/components/sidebar_row.dart';
import 'package:my_app/models/Sidebar.dart';

import '../constants.dart';

class SidebarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(34.0),),
        color: kSidebarBackgroundColor,
      ),
      child: SafeArea(
        child: Column(children: [

          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('asset/images/profile.jpg'),
                radius: 21.0,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Yang Liang",style: kHeadlineLabelStyle,),
                  SizedBox(height: 5,),
                  Text("License end on 21 Jan, 2021", style: kSearchTextStyle,),
                ],
              ),

            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.09,),
          SidebarRow(item: sidebarItems[0],),
          SizedBox(height: 32.0,),

          SidebarRow(item: sidebarItems[1],),
          SizedBox(height: 32.0,),

          SidebarRow(item: sidebarItems[2],),
          SizedBox(height: 32.0,),

          SidebarRow(item: sidebarItems[3],),
          SizedBox(height: 32.0,),

          Spacer(),

          Row(
            children: [
              Image.asset('asset/icons/icon-logout.png', width: 17.0,),
              SizedBox(width: 10.0,),
              Text('Log out', style: kSecondaryCalloutLabelStyle,),
            ],
          )

        ]),
      ),
      padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
    );
  }
}
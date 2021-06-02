import 'package:flutter/material.dart';
import 'package:my_app/components/sidebar_button.dart';

import '../constants.dart';

class HomescreenNavibar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 30),
              child: Container(
                height: 45.0,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 16.0,
                        offset: Offset(0, 10),
                        color: kShadowColor),
                  ],
                ),
                child: TextField(
                  onChanged: (newText) {
                    print(newText);
                  },
                  cursorColor: kPrimaryLabelColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: kPrimaryLabelColor, size: 20,),
                    hintText: "Search for courses",
                    hintStyle: kSearchPlaceholderStyle,
                  ),
                  style: kSearchTextStyle,
                ),
              ),
            ),
          ),
          Icon(
            Icons.notifications,
            size: 30,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}
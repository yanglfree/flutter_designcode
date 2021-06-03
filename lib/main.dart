import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/Course.dart';

import 'components/cards/explore_course_list.dart';
import 'components/cards/recent_course_card.dart';
import 'components/homescreen_navibar.dart';
import 'components/recent_course_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage());
    // home: WebsocketTestRoute());
    // );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              HomescreenNavibar(),
              Container(
                padding: EdgeInsets.all(12.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recents", style: kTitle1Style,),
                    Text("23courses, more coming", style: kSubtitleStyle,),
                  ],
                ),
              ),
              RecentCourseList(),

              Padding(
                padding: EdgeInsets.only( left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
                child: Text("Explore", style: kTitle1Style,),
              ),
              ExploreCourseList(),
            ],
          ),
        ),
      ),
    );
  }
}












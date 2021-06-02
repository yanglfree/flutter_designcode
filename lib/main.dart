import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/Course.dart';

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

class ExploreCourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ExploreCourseCard(course: exploreCourses[index]);
          },
          itemCount: recentCourses.length,
        ),

      ),
    );
  }
}

class ExploreCourseCard extends StatelessWidget {

  ExploreCourseCard({@required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 120.0,
      decoration: BoxDecoration(
        gradient: course.background
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Row (
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.courseSubtitle, style: kCardSubtitleStyle,),
                  SizedBox(height: 6,),
                  Text(course.courseTitle, style: kCardTitleStyle,),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}








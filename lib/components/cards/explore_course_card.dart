import 'package:flutter/material.dart';
import 'package:my_app/models/Course.dart';

import '../../constants.dart';

class ExploreCourseCard extends StatelessWidget {

  ExploreCourseCard({@required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 120.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: course.background,
          boxShadow: [
            BoxShadow(blurRadius: 10.0, color: course.background.colors[0], offset: Offset(0, 10)),
          ]
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
            Image.asset('asset/illustrations/${course.illustration}', fit: BoxFit.cover,),
          ],
        ),
      ),
    );
  }
}
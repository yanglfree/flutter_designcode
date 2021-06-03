import 'package:flutter/material.dart';
import 'package:my_app/models/Course.dart';

import '../../constants.dart';

class RecentCourseCard extends StatelessWidget {

  RecentCourseCard({this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20.0, left: 10.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: course.background,
                  boxShadow: [
                    BoxShadow(color: course.background.colors[0].withOpacity(0.3), blurRadius: 30.0, offset: Offset(0, 20)),
                    BoxShadow(color: course.background.colors[1].withOpacity(0.3), blurRadius: 30.0, offset: Offset(0, 20))
                  ]
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.courseSubtitle,
                      style: kCardSubtitleStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      course.courseTitle,
                      style: kCardTitleStyle,
                    ),
                    Expanded(
                      child: Image.asset(
                        'asset/illustrations/${course.illustration}',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 42.0),
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(blurRadius: 16.0, color: kShadowColor, offset: Offset(0, 4)),
                  ]
              ),
              child: Image.asset('asset/logos/${course.logo}'),
              padding: EdgeInsets.all(12.0),
            ),
          )

        ]

    );
  }
}

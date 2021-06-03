import 'package:flutter/material.dart';
import 'package:my_app/models/Course.dart';

import 'explore_course_card.dart';

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
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 20.0 : 0.0,
                right: 30.0,
              ),
              child: ExploreCourseCard(course: exploreCourses[index]),
            );
          },
          itemCount: exploreCourses.length,
        ),

      ),
    );
  }
}
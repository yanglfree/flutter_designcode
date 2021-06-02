import 'package:flutter/material.dart';
import 'package:my_app/models/Course.dart';

import 'cards/recent_course_card.dart';

class RecentCourseList extends StatefulWidget {
  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  List<Container> indicators = [];
  int currentPageIndex = 0;

  Widget updateIndicators() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: recentCourses.map((course) {
          var index = recentCourses.indexOf(course);
          return Container(
            width: 7.0,
            height: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentPageIndex ? Colors.blue : Colors.grey,
            ),
          );
        }).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 320.0,
            child: PageView.builder(
              itemCount: recentCourses.length,
              // ignore: missing_return
              itemBuilder: (context, index) {
                return Opacity(
                    opacity: currentPageIndex == index ? 1.0 : 0.5 ,
                    child: RecentCourseCard(course: recentCourses[index],));
              },
              controller: PageController(initialPage: 0, viewportFraction: 0.63),
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            )
        ),
        updateIndicators(),
      ],
    );
  }
}

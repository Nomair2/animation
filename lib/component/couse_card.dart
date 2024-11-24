import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.couse});
  final Course couse;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: 260,
      decoration: BoxDecoration(
          color: couse.bgColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                couse.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 12),
                child: Text(
                  couse.description,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Text(
                '61 SECTIONS - 11 HOURS',
                style: TextStyle(color: Colors.white54),
              ),
              Spacer(),
              Row(
                children: List.generate(
                    3,
                    (index) => Transform.translate(
                          offset: Offset((-10 * index).toDouble(), 0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                                "assets/avaters/Avatar ${index + 1}.jpg"),
                          ),
                        )),
              ),
            ],
          )),
          SvgPicture.asset(couse.icon)
        ],
      ),
    );
  }
}

class Course {
  final String title, description, icon;
  final Color bgColor;

  Course(
      {required this.title,
      this.description = "Build and animate an iOS appfrom scratch",
      this.icon = "assets/icons/ios.svg",
      this.bgColor = const Color(0xff7553f6)});
}

List<Course> courese = [
  Course(title: "Animatoins in SwiftUI"),
  Course(
      title: "Animatoins in Flutter",
      icon: "assets/icons/code.svg",
      bgColor: Color(0xff80a4ff)),
  Course(title: "Animatoins in SwiftUI"),
];
List<Course> recentCourse = [
  Course(title: "State Machine"),
  Course(
      title: "Animatoins Menu ",
      icon: "assets/icons/code.svg",
      bgColor: Color(0xff9cc5ff)),
  Course(title: "Flutter with Rive"),
  Course(
      title: "Animated Menu ",
      bgColor: Color(0xff9cc5ff),
      icon: "assets/icons/code.svg"),
];

import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isAcitve,
  });

  final bool isAcitve;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4,
      margin: EdgeInsets.only(bottom: 2),
      width: isAcitve ? 20 : 0,
      decoration: BoxDecoration(
          color: Color(0xff81b4ff),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

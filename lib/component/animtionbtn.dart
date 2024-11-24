import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class animationbtn extends StatelessWidget {
  const animationbtn({
    super.key,
    required this.press,
    required RiveAnimationController btncontroller,
  }) : _btncontroller = btncontroller;

  final RiveAnimationController _btncontroller;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 260,
        height: 64,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button (1).riv",
              controllers: [_btncontroller],
            ),
            const Positioned.fill(
                top: 8,
                left: 60,
                // right: 50,
                child: Row(
                  children: [
                    Icon(CupertinoIcons.arrow_right),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Start the couse",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

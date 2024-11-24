import 'dart:math';

import 'package:animation_app/component/animated_bar.dart';
import 'package:animation_app/component/menu_btn.dart';
import 'package:animation_app/component/side_menu.dart';
import 'package:animation_app/constent.dart';
import 'package:animation_app/screen/onboarding/home_page.dart';
import 'package:animation_app/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'models/rive_assets.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  RiveAsset selectedBottomNav = bootomNavs.first;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  late SMIBool isSideBarClose;
  bool isSideMenuClose = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(
            () {
              setState(() {});
            },
          );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor2,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            AnimatedPositioned(
                duration: Duration(microseconds: 500),
                height: MediaQuery.of(context).size.height,
                width: 288,
                curve: Curves.fastOutSlowIn,
                left: isSideMenuClose ? -288 : 0,
                child: SideMenu()),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animation.value - 30 * animation.value * pi / 180),
              child: Transform.translate(
                  offset: Offset(animation.value * 288, 0),
                  child: Transform.scale(
                      scale: scaleAnimation.value,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          child: HomePage()))),
            ),
            AnimatedPositioned(
              top: 16,
              duration: Duration(microseconds: 500),
              left: isSideMenuClose ? 0 : 220,
              curve: Curves.fastOutSlowIn,
              child: MenuBtn(
                press: () {
                  print(isSideBarClose.value);
                  isSideBarClose.value = !isSideBarClose.value;
                  print(isSideBarClose.value);
                  if (isSideMenuClose) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(() {
                    isSideMenuClose = isSideBarClose.value;
                  });
                  print(isSideMenuClose);
                },
                riveOnInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: "State Machine");
                  isSideBarClose = controller.findSMI('isOpen') as SMIBool;
                  isSideBarClose.value = true;
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                  color: backgroundColor2.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    bootomNavs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        bootomNavs[index].input!.change(true);
                        if (bootomNavs[index] != selectedBottomNav) {
                          setState(() {
                            selectedBottomNav = bootomNavs[index];
                          });
                        }
                        Future.delayed(
                          Duration(seconds: 1),
                          () {
                            bootomNavs[index].input!.change(false);
                          },
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBar(
                              isAcitve: bootomNavs[index] == selectedBottomNav),
                          SizedBox(
                            width: 36,
                            height: 36,
                            child: Opacity(
                              opacity: bootomNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                bootomNavs[index].src,
                                artboard: bootomNavs[index].arboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName: bootomNavs[index]
                                              .stateMachineName);

                                  bootomNavs[index].input =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

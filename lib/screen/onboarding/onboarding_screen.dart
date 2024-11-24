import 'dart:ui';

import 'package:animation_app/component/animtionbtn.dart';
import 'package:animation_app/component/custom_sign_in_dialog.dart';
import 'package:animation_app/component/sign_in_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as image;
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btncontroller;
  @override
  void initState() {
    _btncontroller = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: image.Image.asset("assets/Background/Spline.png"),
          ),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            child: const SizedBox(),
          )),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          )),
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: Duration(microseconds: 240),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text(
                            "Learn design & code ",
                            style:
                                TextStyle(fontSize: 60, fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Don't skip design. Learn design and code . by building real apps with Flutter and Swift. Complete courses about the best tools.")
                        ],
                      )),
                  const Spacer(
                    flex: 2,
                  ),
                  animationbtn(
                    btncontroller: _btncontroller,
                    press: () {
                      setState(() {
                        _btncontroller.isActive = true;
                      });
                      Future.delayed(Duration(milliseconds: 800), () {
                        setState(() {
                          isSignInDialogShown = true;
                        });
                        customSigninDialog(context, onclose: (_) {
                          setState(() {
                            isSignInDialogShown = false;
                          });
                        });
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 25, left: 25, top: 20, bottom: 40),
                    child: Text(
                        "Purchase includs access to 30+ courses , 240+ premium tutorials , 120+ hours of videos , source files and certificates"),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}

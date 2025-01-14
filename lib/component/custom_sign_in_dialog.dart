import 'package:flutter/material.dart';

import 'sign_in_form.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onclose}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    transitionDuration: const Duration(microseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
          child: child,
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ));
    },
    barrierLabel: "Sign In ",
    pageBuilder: (context, _, __) => Builder(builder: (context) {
      return Center(
        child: Container(
          height: 640,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.only(top: 32, right: 24, left: 24),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.94),
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const Text(
                      "Sign In ",
                      style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16, left: 16, top: 10),
                      child: Text(
                        "Access to 240+ hours of content. Learn design and code. by building real apps with Flutter and Swift .",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SignInForm(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.black12,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black12,
                        )),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Sign up with Email , Apple or Google ",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.zero,
                          child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/email_box.svg",
                                height: 64,
                                width: 64,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/apple_box.svg",
                                height: 64,
                                width: 64,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/google_box.svg",
                                height: 64,
                                width: 64,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    right: 0,
                    left: 0,
                    bottom: -35,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    }),
  ).then(onclose);
}

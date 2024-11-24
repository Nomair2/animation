import 'package:animation_app/entry_point.dart';
import 'package:animation_app/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confitti;

  bool isShowloadin = false;
  bool isShowConfetti = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (email) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset("assets/icons/email.svg"),
                        )),
                  ),
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (password) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset("assets/icons/password.svg"),
                        )),
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      print(isShowloadin);
                      setState(() {
                        isShowloadin = true;
                        isShowConfetti = true;
                      });
                      print(isShowloadin);
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          if (_key.currentState!.validate()) {
                            check.fire();
                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                setState(() {
                                  isShowloadin = false;
                                });
                                confitti.fire();
                                Future.delayed(
                                  Duration(seconds: 1),
                                  () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const EntryPoint(),
                                        ));
                                  },
                                );
                              },
                            );
                          } else {
                            error.fire();
                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                setState(() {
                                  isShowloadin = false;
                                });
                              },
                            );
                          }
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff77d8e),
                        minimumSize: const Size(double.infinity, 65),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ))),
                    icon: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Color(0xfffe0037),
                    ),
                    label: const Text("Sign In "))
              ],
            )),
        isShowloadin
            ? CustomPositioned(
                child: Positioned.fill(
                    child: RiveAnimation.asset(
                "assets/RiveAssets/check.riv",
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard);
                  check = controller.findSMI("Check") as SMITrigger;
                  error = controller.findSMI("Error") as SMITrigger;
                  reset = controller.findSMI("Reset") as SMITrigger;
                },
              )))
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                scale: 7,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/confetti.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(
                      artboard,
                    );
                    confitti =
                        controller.findSMI("Trigger explosion") as SMITrigger;
                  },
                ),
              ))
            : const SizedBox()
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  CustomPositioned({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(height: 100, width: 100, child: child),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

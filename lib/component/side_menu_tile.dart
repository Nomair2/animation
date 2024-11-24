import 'package:animation_app/models/rive_assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile(
      {super.key,
      required this.riveAsset,
      required this.press,
      required this.init,
      required this.isActive});
  final RiveAsset riveAsset;
  final VoidCallback press;
  final ValueChanged<Artboard> init;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Colors.white24,
              height: 1,
            )),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 300),
              height: 56,
              width: isActive ? MediaQuery.of(context).size.width * 0.733 : 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff6792ff),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            GestureDetector(
              onTap: press,
              child: ListTile(
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: RiveAnimation.asset(
                    riveAsset.src,
                    artboard: riveAsset.arboard,
                    onInit: init,
                  ),
                ),
                title: Text(
                  riveAsset.title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

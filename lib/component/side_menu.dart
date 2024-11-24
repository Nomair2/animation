import 'package:animation_app/component/info_card.dart';
import 'package:animation_app/component/side_menu_tile.dart';
import 'package:animation_app/models/rive_assets.dart';
import 'package:animation_app/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedmenu = sideMenu.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        // width: MediaQuery.of(context).size.width * 0.7,
        width: 288,
        color: Color(0xff17203a),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InfoCard(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 34, left: 24, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            ...sideMenu.map(
              (menu) => SideMenuTile(
                riveAsset: menu,
                init: (artboard) {
                  print("1");
                  StateMachineController contoller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  print("1");
                  menu.input = contoller.findSMI("active") as SMIBool;
                },
                isActive: selectedmenu == menu,
                press: () {
                  print(menu.input!.value);
                  print("1");
                  menu.input!.change(true);
                  Future.delayed(
                    Duration(seconds: 1),
                    () {
                      menu.input!.change(false);
                      print("2");
                    },
                  );
                  setState(() {
                    selectedmenu = menu;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 34, left: 24, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            ...sideMenu2.map(
              (menu) => SideMenuTile(
                riveAsset: menu,
                init: (artboard) {
                  StateMachineController contoller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  menu.input = contoller.findSMI("active") as SMIBool;
                },
                isActive: selectedmenu == menu,
                press: () {
                  menu.input!.change(true);
                  Future.delayed(
                    Duration(seconds: 1),
                    () {
                      menu.input!.change(false);
                    },
                  );
                  setState(() {
                    selectedmenu = menu;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

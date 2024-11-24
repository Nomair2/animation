import 'package:rive/rive.dart';

class RiveAsset {
  final String arboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.arboard,
      required this.stateMachineName,
      required this.title,
      this.input});
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bootomNavs = [
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Timer"),
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notifications"),
  // RiveAsset("assets/RiveAssets/icons.riv",
  //     arboard: "USER",
  //     stateMachineName: "User_Interactivity",
  //     title: "Profile"),
];

List<RiveAsset> sideMenu = [
  // RiveAsset("assets/RiveAssets/icons.riv",
  //     arboard: "HOME", stateMachineName: "HOME_Interactivity", title: "Home"),
  // RiveAsset("assets/RiveAssets/icons.riv",
  //     arboard: "HOME", stateMachineName: "HOME_Interactivity", title: "Home"),
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
      title: "Favorites"),
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
];

List<RiveAsset> sideMenu2 = [
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "History"),
  RiveAsset("assets/RiveAssets/icons.riv",
      arboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notification"),
];

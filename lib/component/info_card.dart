import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        "Nomair Nasser",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        "Developer",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

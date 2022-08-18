import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).iconTheme.color,
          shape: const RoundedRectangleBorder(),
        ),
        child: Image.asset("images/list.png",
            color: Theme.of(context).colorScheme.background),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    });
  }
}

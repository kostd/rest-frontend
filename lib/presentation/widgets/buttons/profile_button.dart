import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/presentation/pages/profile_page.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        GetDelegate getDelegate = Get.find();
        getDelegate.toNamed(ProfilePage.routeName);
      },
      icon: Image.asset(
        "images/profile.png",
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}

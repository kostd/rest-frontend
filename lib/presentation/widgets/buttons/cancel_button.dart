import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.cancel,
      ),
      color: Theme.of(context).colorScheme.onPrimary,
      onPressed: () {
        GetDelegate routerDelegate = Get.find();
        routerDelegate.popRoute();
      },
    );
  }
}

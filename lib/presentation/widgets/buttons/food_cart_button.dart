import 'package:flutter/material.dart';
import 'package:rest_frontend/presentation/dialogs/error_dialog.dart';

class FoodCartButton extends StatelessWidget {
  const FoodCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // пока корзина не реализована, воспользуемся кнопкой для получения отчета об ошибке
        showErrorReportDialog();
      },
      iconSize: 8,
      icon: Image.asset(
        "images/foodcart.png",
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}

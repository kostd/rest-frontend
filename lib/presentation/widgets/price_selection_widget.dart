import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_frontend/domain/entities/dish.dart';

class PriceSelectionWidget extends StatelessWidget {
  const PriceSelectionWidget({Key? key, required this.dish}) : super(key: key);
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: dish.cost.toString(),
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 20)),
      WidgetSpan(
          child: Icon(
        CupertinoIcons.money_rubl,
        color: Theme.of(context).iconTheme.color,
        size: 24,
      )),
      WidgetSpan(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black54.withOpacity(0.4),
          ),
          child: Text("+",
              style: TextStyle(
                  fontSize: 26,
                  color: Theme.of(context).colorScheme.background)),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    ]));
  }
}

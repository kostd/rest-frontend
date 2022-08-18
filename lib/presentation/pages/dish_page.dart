import 'package:flutter/material.dart';

import '../../config/adaptive.dart';
import '../widgets/bars/search_bar.dart';
import '../widgets/buttons/food_cart_button.dart';
import '../widgets/buttons/menu_button.dart';
import '../widgets/buttons/phone_call_button.dart';
import '../widgets/logo_our_times.dart';
import '../widgets/reflowing_scaffold.dart';

/// страница детального представления блюда
class DishPage extends StatefulWidget {
  static const String routeName = 'dish';

  const DishPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ReflowingScaffold(
      appBar: isDisplayDesktop(context)
          ? SearchBar()
          : AppBar(
              leading: const MenuButton(),
              title: const LogoOurTimes(),
              centerTitle: true,
              actions: const [
                PhoneCallButton(),
                FoodCartButton(),
              ],
              elevation: 0,
            ),
      body: Column(children: [
        Image.asset(
          "images/temp.jpg",
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}

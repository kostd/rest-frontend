import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/presentation/logic/menu_cubit.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';
import 'package:rest_frontend/presentation/widgets/buttons/menu_button.dart';
import 'package:rest_frontend/presentation/widgets/buttons/phone_call_button.dart';
import 'package:rest_frontend/presentation/widgets/logo_our_times.dart';

import '../../config/adaptive.dart';
import '../widgets/bars/search_bar.dart';
import '../widgets/buttons/food_cart_button.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/reflowing_scaffold.dart';

/// страница меню, или списка блюд.
class MenuPage extends StatelessWidget {
  static const String routeName = 'menu';

  const MenuPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    MenuCubit menuCubit = Get.find();

    return BlocBuilder<MenuCubit, MenuState>(
      bloc: menuCubit,
      builder: (context, state) {
        return ReflowingScaffold(
          appBarLeft: const LogoOurTimes(),
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
          appBarRight: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              PhoneCallButton(),
              FoodCartButton(),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!(isDisplayDesktop(context))) SearchBar(),
              Expanded(
                child: MenuList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MenuList extends StatelessWidget {
  MenuList({Key? key}) : super(key: key);

  final MenuCubit _menuCubit = Get.find();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
        bloc: _menuCubit,
        builder: (context, state) {
          return ListView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: isDisplayDesktop(context) ? 8 : 12),
              shrinkWrap: true,
              itemCount: state.dishes.length,
              itemBuilder: (context, index) {
                return MenuItemCard(
                  dish: state.dishes[index],
                );
              });
        });
  }
}

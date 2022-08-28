import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/presentation/logic/menu_cubit.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';
import 'package:rest_frontend/presentation/widgets/bars/food_cart_bar.dart';
import 'package:rest_frontend/presentation/widgets/buttons/menu_button.dart';
import 'package:rest_frontend/presentation/widgets/buttons/phone_call_button.dart';
import 'package:rest_frontend/presentation/widgets/buttons/profile_button.dart';
import 'package:rest_frontend/presentation/widgets/cart_drawer.dart';
import 'package:rest_frontend/presentation/widgets/logo_our_times.dart';
import 'package:rest_frontend/presentation/widgets/menu_drawer.dart';

import '../../config/adaptive.dart';
import '../widgets/bars/search_bar.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/reflowing_scaffold.dart';

/// страница меню, или списка блюд.
class MenuPage extends StatelessWidget {
  static const String routeName = 'menu';

  const MenuPage({Key? key}) : super(key: key);

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
                    ProfileButton(),
                  ],
                  elevation: 0,
                ),
          appBarRight: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              PhoneCallButton(),
              ProfileButton(),
            ],
          ),
          body: BottomBar(
            body: (context, controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (!(isDisplayDesktop(context))) SearchBar(),
                  Expanded(
                    child: MenuList(),
                  ),
                ],
              );
            },
            barColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            // #TODO: скролл подключен не совсем полноценно, поэтому это не работает (оно  и так по дефолту)
            // hideOnScroll: true,
            child: FoodCartBar(),
          ),
          drawer: MenuDrawer(),
          endDrawer: CartDrawer(),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';
import 'package:rest_frontend/presentation/widgets/tight_highlight.dart';

import '../../domain/entities/dish.dart';
import '../logic/menu_cubit.dart';
import '../pages/dish_page.dart';

class MenuItemCard extends StatelessWidget {
  final Dish dish;
  MenuItemCard({Key? key, required this.dish}) : super(key: key);

  final MenuCubit _menuCubit = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Image.asset(
                      // #TODO: у каждого блюда должна быть своя картинка
                      "images/temp.jpg",
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      GetDelegate routerDelegate = Get.find();
                      routerDelegate.toNamed(DishPage.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: BlocBuilder<MenuCubit, MenuState>(
                      bloc: _menuCubit,
                      builder: (context, state) {
                        return TightHighlight(
                            text: dish.name,
                            term: state.searchText,
                            width: MediaQuery.of(context).size.width * 0.6,
                            textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14));
                      },
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(""),
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: dish.cost.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 20)),
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
                                color:
                                    Theme.of(context).colorScheme.background)),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ])),
                ],
              )),
          if (dish.consist?.isNotEmpty ?? false)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Divider(),
            ),
          if (dish.consist?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  BlocBuilder<MenuCubit, MenuState>(
                    bloc: _menuCubit,
                    builder: (context, state) {
                      return TightHighlight(
                          text: dish.consist ?? "",
                          term: state.searchText,
                          width: MediaQuery.of(context).size.width * 0.8,
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12));
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

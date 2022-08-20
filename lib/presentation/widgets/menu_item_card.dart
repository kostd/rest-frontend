import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';
import 'package:rest_frontend/presentation/widgets/price_selection_widget.dart';
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
                      _menuCubit.selectDish(dish);
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
                  PriceSelectionWidget(dish: dish),
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

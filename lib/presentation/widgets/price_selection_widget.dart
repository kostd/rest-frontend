import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/domain/entities/dish.dart';
import 'package:rest_frontend/presentation/logic/cart_cubit.dart';
import 'package:rest_frontend/presentation/state/cart_state.dart';

// Компонент добавления блюда в корзину. Рисуется в списке блюд и на форме блюда.
// По центру отображает количество блюд данного типа, уже добавленных в корзину.
// Справа от количества всегда отображается плюсик. Слева от количества отображается
// минус, если в корзине больше нуля блюд данного типа. А еще (временно?) отображает
// цену блюда.
class PriceSelectionWidget extends StatelessWidget {
  PriceSelectionWidget({Key? key, required this.dish}) : super(key: key);
  final Dish dish;

  final CartCubit _cartCubit = Get.find();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
        bloc: _cartCubit,
        builder: (context, state) {
          return Text.rich(TextSpan(children: [
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
            if (state.dishes.containsKey(dish))
              WidgetSpan(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                  child: Text("-",
                      style: TextStyle(
                          fontSize: 26,
                          color: Theme.of(context).colorScheme.onPrimary)),
                  onPressed: () {
                    _cartCubit.removeFromCart(dish);
                  },
                ),
              ),
            if (state.dishes.containsKey(dish) && state.dishes[dish] != null)
              WidgetSpan(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                  child: Text(state.dishes[dish]!.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary)),
                  onPressed: () {},
                ),
              ),
            WidgetSpan(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
                ),
                child: Text("+",
                    style: TextStyle(
                        fontSize: 26,
                        color: Theme.of(context).colorScheme.background)),
                onPressed: () {
                  _cartCubit.addToCart(dish);
                },
              ),
            ),
          ]));
        });
  }
}

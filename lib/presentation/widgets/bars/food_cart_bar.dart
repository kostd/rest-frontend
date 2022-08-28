import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:rest_frontend/presentation/logic/cart_cubit.dart';
import 'package:rest_frontend/presentation/state/cart_state.dart';

///*******************************************************
/// **           Нижняя панель "корзина"                **
/// ******************************************************
///
/// -- обеспечивает быстрый переход в корзину

class FoodCartBar extends StatelessWidget {
  FoodCartBar({Key? key}) : super(key: key);

  final CartCubit _cartCubit = Get.find();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
        bloc: _cartCubit,
        builder: (context, state) {
          return InkWell(
              onTap: () {
                // на endDrawer у нас повешена корзина, CartDrawer
                Scaffold.of(context).openEndDrawer();
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  iconSize: 2,
                  icon: Image.asset(
                    "images/foodcart.png",
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Text("заказ ${state.dishes.length}",
                    style: CyrillicFonts.oranienbaum(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.onPrimary)),
              ])
              // textAlign: TextAlign.center,
              );
        });
  }
}

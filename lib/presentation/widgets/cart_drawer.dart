import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:rest_frontend/presentation/logic/cart_cubit.dart';
import 'package:rest_frontend/presentation/state/cart_state.dart';
import 'package:rest_frontend/presentation/widgets/price_selection_widget.dart';
import 'package:rest_frontend/presentation/widgets/tight_highlight.dart';

class CartDrawer extends StatelessWidget {
  final CartCubit _cartCubit = Get.find();

  CartDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
        bloc: _cartCubit,
        builder: (context, state) {
          return Card(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // пустая колонка чтобы остальные элементы строки красиво выстроились
                              Column(),
                              Text(
                                "Корзина",
                                style: CyrillicFonts.badScript(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),

                              IconButton(
                                icon: const Icon(Icons.cancel),
                                color: Theme.of(context).colorScheme.onPrimary,
                                onPressed: () {
                                  Scaffold.of(context).closeEndDrawer();
                                },
                              )
                            ]),
                        Row(),
                        ListView(
                            shrinkWrap: true,
                            children: state.dishes.entries
                                .map(
                                  (entry) => Builder(
                                    builder: (context) {
                                      return Card(
                                        elevation: 0,
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TightHighlight(
                                                text: entry.key.name,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                term: '',
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    _cartCubit
                                                        .removeAllFromCart(
                                                            entry.key);
                                                  },
                                                  icon:
                                                      const Icon(Icons.cancel))
                                            ],
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                // #TODO: тут этот компонент мог быть расположить свои элементы по углам, было бы классно (как в макете)
                                                PriceSelectionWidget(
                                                    dish: entry.key),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16),
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            text: (entry.value *
                                                                    entry.key
                                                                        .cost)
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onPrimary,
                                                                fontSize: 20)),
                                                        WidgetSpan(
                                                            child: Icon(
                                                          CupertinoIcons
                                                              .money_rubl,
                                                          color:
                                                              Theme.of(context)
                                                                  .iconTheme
                                                                  .color,
                                                          size: 24,
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ])
                                        ]),
                                      );
                                    },
                                  ),
                                )
                                .toList()),
                        Row(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Итого",
                                style: CyrillicFonts.badScript(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: (state.totalAmount).toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 20)),
                                    WidgetSpan(
                                        child: Icon(
                                      CupertinoIcons.money_rubl,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 24,
                                    )),
                                  ],
                                ),
                              ),
                            ]),
                      ])));
        });
  }
}

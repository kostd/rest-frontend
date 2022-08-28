import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:rest_frontend/presentation/pages/menu_page.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';

import '../../config/adaptive.dart';
import '../logic/menu_cubit.dart';

///*******************************************************
/// **           Боковая панель "drawer"                **
/// ******************************************************
///
/// -- позволяет выбрать категорию в меню. Блюда этой категории
/// будут отображаться в списке блюд.
class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);

  final MenuCubit _menuCubit = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: isDisplayDesktop(context)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              // пустая колонка чтобы остальные элементы строки красиво выстроились
              Column(),
              Text(
                "Меню",
                style: CyrillicFonts.badScript(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              if (!isDisplayDesktop(context))
                IconButton(
                  icon: const Icon(Icons.cancel),
                  color: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                )
            ]),
        BlocBuilder<MenuCubit, MenuState>(
            bloc: _menuCubit,
            builder: (context, state) {
              return ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: isDisplayDesktop(context) ? 8 : 32),
                  shrinkWrap: true,
                  children: state.categories
                      .map(
                        (category) => Builder(
                          builder: (context) {
                            return InkWell(
                              onTap: () {
                                _menuCubit.selectCategory(category);
                                Scaffold.of(context).closeDrawer();
                                // если drawer открыли не со страницы списка (могли например открыть со страницы блюда),
                                // перейдем на страницу списка
                                GetDelegate getDelegate = Get.find();
                                getDelegate.toNamed(MenuPage.routeName);
                              },
                              child: Text.rich(
                                TextSpan(children: [
                                  WidgetSpan(
                                    child: IconButton(
                                      onPressed: () {
                                        _menuCubit.selectCategory(category);
                                        Scaffold.of(context).closeDrawer();
                                      },
                                      icon: category.iconPath != null
                                          ? Image.asset(category.iconPath!,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color)
                                          : const Icon(
                                              Icons.pedal_bike_rounded,
                                            ),
                                      iconSize: 36,
                                    ),
                                  ),
                                  TextSpan(text: " " + category.name),
                                ]),
                                style: CyrillicFonts.badScript(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            );
                          },
                        ),
                      )
                      .toList());
            })
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/presentation/logic/menu_cubit.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';

import '../../../config/adaptive.dart';

/// Панелька поиска
class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final MenuCubit menuCubit = Get.find();

  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return BlocBuilder<MenuCubit, MenuState>(
        bloc: menuCubit,
        builder: (context, state) {
          return Column(children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: Card(
                    margin: EdgeInsets.only(
                        left: isDisplayDesktop(context) ? 8 : 12, right: 12),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: isDisplayDesktop(context) ? 8 : 12,
                            right: 12),
                        child: TextSelectionTheme(
                          data: TextSelectionTheme.of(context).copyWith(
                            cursorColor: themeData.hintColor,
                          ),
                          child: TextField(
                            expands: true,
                            textInputAction: TextInputAction.search,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: "Поиск",
                              fillColor: themeData.bottomAppBarColor,
                              border: InputBorder.none,
                              filled: true,
                              suffixIcon: IconButton(
                                tooltip: 'Поиск',
                                icon: const Icon(Icons.search_outlined),
                                color: themeData.hintColor,
                                onPressed: () {},
                              ),
                              isCollapsed: false,
                            ),
                            onChanged: (value) {
                              menuCubit.setSearchText(value);
                            },
                          ),
                        )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.white38)),
                    elevation: 0,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: isDisplayDesktop(context)
                      ? null
                      : BoxDecoration(
                          color: Colors.lightGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(0)),
                  height: 60,
                )),
              ],
            )
          ]);
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}

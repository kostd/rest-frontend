import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:rest_frontend/presentation/logic/menu_cubit.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';
import 'package:rest_frontend/presentation/widgets/buttons/cancel_button.dart';
import 'package:rest_frontend/presentation/widgets/buttons/profile_button.dart';
import 'package:rest_frontend/presentation/widgets/price_selection_widget.dart';

import '../../config/adaptive.dart';
import '../widgets/bars/search_bar.dart';
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
  final MenuCubit _menuCubit = Get.find();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
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
      body: BlocBuilder<MenuCubit, MenuState>(
        bloc: _menuCubit,
        builder: (context, state) {
          return Column(children: [
            Stack(children: [
              Image.asset(
                "images/temp.jpg",
                fit: BoxFit.cover,
              ),
              const Positioned(right: 4, child: CancelButton()),
              Positioned(
                bottom: 2,
                child: Text(state.selectedDish.name,
                    style: CyrillicFonts.badScript(
                        // #TODO: вот бы динамически подбирать цвет, чтобы текст был контрастным
                        // на фоне картинки (который может быть любым)
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(children: [
                PriceSelectionWidget(dish: state.selectedDish),
              ], mainAxisAlignment: MainAxisAlignment.start),
            ),
            const Divider(),
            state.selectedDish.consist != null
                ? state.selectedDish.consist!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Состав",
                                style: CyrillicFonts.badScript(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )
                            ]))
                    : const Text("")
                : const Text(""),
            state.selectedDish.consist != null
                ? state.selectedDish.consist!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state.selectedDish.consist!,
                                style: CyrillicFonts.oranienbaum(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )
                            ]))
                    : const Text("")
                : const Text(""),
          ]);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:rest_frontend/presentation/logic/auth_cubit.dart';
import 'package:rest_frontend/presentation/widgets/buttons/cancel_button.dart';

import '../logic/application_cubit.dart';
import '../state/application_state.dart';
import '../state/auth_state.dart';
import '../widgets/logo_our_times.dart';
import '../widgets/reflowing_scaffold.dart';
import 'about_page.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profile';

  ProfilePage({Key? key}) : super(key: key);

  final AuthCubit _authCubit = Get.find();
  final ApplicationCubit _applicationCubit = Get.find();

  @override
  Widget build(BuildContext context) {
    return ReflowingScaffold(
        appBarLeft: const LogoOurTimes(),
        appBar: AppBar(
          leading: const Text(""),
          title: Text(
            "Профиль",
            style: CyrillicFonts.badScript(
              fontSize: 28,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          toolbarHeight: 70,
          titleSpacing: 0.0,
          centerTitle: true,
          actions: const [CancelButton()],
          elevation: 0,
          //  bottom: BorderSide(color: themeData.dividerColor, width: 2.0)))
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            shrinkWrap: true,
            children: [
              Column(children: [
                Container(
                    padding: const EdgeInsets.only(left: 2, top: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text("Общая информация",
                        style: TextStyle(fontSize: 18))),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: BlocBuilder<AuthCubit, AuthState>(
                      bloc: _authCubit,
                      builder: (context, state) {
                        return Card(
                            color: context.theme.cardColor,
                            child: ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                children: [
                                  Text("Имя: ${state.currentUser.name}"),
                                  Text("Телефон: ${state.currentUser.phone}"),
                                ]));
                      },
                    )),
                Container(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text("Настройки приложения",
                        style: TextStyle(fontSize: 18))),
                Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: BlocBuilder<ApplicationCubit, ApplicationState>(
                      bloc: _applicationCubit,
                      builder: (context, state) {
                        return Card(
                            child: SizedBox(
                                height: 50.0,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Ночной режим",
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Transform.scale(
                                              scale: 1.1,
                                              child: Switch(
                                                  // #TODO: опять литералы цветов
                                                  activeColor:
                                                      const Color(0xFFFFFF),
                                                  activeTrackColor:
                                                      Color(0xFBC22F),
                                                  value: state.themeMode ==
                                                      ThemeMode.dark,
                                                  onChanged: (value) {
                                                    _applicationCubit
                                                        .setThemeMode(value
                                                            ? ThemeMode.dark
                                                            : ThemeMode.light);
                                                  }))),
                                    ])));
                      },
                    )),
                InkResponse(
                    highlightShape: BoxShape.rectangle,
                    onTap: () {
                      GetDelegate routerDelegate = Get.find();
                      routerDelegate.toNamed(AboutPage.routeName);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Card(
                            child: SizedBox(
                                height: 50.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text("О приложении")),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: const Icon(
                                            Icons.chevron_right_outlined,
                                            size: 30))
                                  ],
                                )))))
              ])
            ]));
  }
}

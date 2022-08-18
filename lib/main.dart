import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:rest_frontend/config/theme_consts.dart';
import 'package:rest_frontend/presentation/dialogs/error_dialog.dart';
import 'package:rest_frontend/presentation/logic/application_cubit.dart';
import 'package:rest_frontend/presentation/pages/dish_page.dart';
import 'package:rest_frontend/presentation/pages/menu_page.dart';

import 'injector.dart';
import 'presentation/state/application_state.dart';

void main() {
  initializeDependencies();
  initializeLogging();
  Logger log = Logger("main.dart");
  log.info("logging initialized!");
  Get.put(Get.createDelegate());
  log.info("Инициализация выполнена.");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  /// Будем сраазу использовать навигацию 2.0 (она же navigator 2.0, nav2 или router).
  /// Т.к. навигация 1.0 позволяла все, кроме restore маршрутов после f5 в браузере. А наша основная цель -- веб,
  /// поэтому нам совершенно необходимо восстанавливать маршруты после f5. Для переезда на nav2 надо 1) не использовать
  /// onGenerateRoute (вместто него карта staticRoutes); 2) создавать GetMaterialApp
  /// не дефолтным конструктором, а его вариантом GetMaterialApp.router и 3) выполнять pushNamed и pop не через static-методы
  /// Navigator`а, а через (доступный через Get.find благодаря put`у здесь) GetDelegate (использовать методы toNamed и popRoute
  /// соответственно). Теперь после f5 работает как программный pop, так и браузерный back, причем используем штатные возможности
  /// библиотки Get, ничего дополнительно подключать не пришлось.
  /// #TODO: пока не работает deep linking в смысле параметров в url, параметры передаются не через url (см. например открытие
  /// DishPage из карточки блюдаа в списке-меню). Пока вроде и не надо.
  final GetDelegate _routerDelegate = Get.find();

  final ApplicationCubit _applicationCubit = Get.find();

  /// карта всех маршрутов. Если сделал новую страничку, добавь маршрут к ней суда
  final Map<String, Widget> staticRoutes = {
    '/': const MenuPage(
      title: 'Ресторан "Наше время"',
    ),
    MenuPage.routeName: const MenuPage(
      title: 'Ресторан "Наше время"',
    ),
    DishPage.routeName: const DishPage(title: "Блюдо ресторана Наше Время>"),
  };

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      // что интересно, здесь GetBuilder объявлен снаружи GetMaterialApp, и все равно работает!
      return BlocBuilder<ApplicationCubit, ApplicationState>(
          bloc: _applicationCubit,
          builder: (context, state) {
            return GetMaterialApp.router(
              title: 'Наше время',
              themeMode: state.themeMode,
              theme: ThemeConsts.lightThemeData.copyWith(
                platform: defaultTargetPlatform,
              ),
              routerDelegate: _routerDelegate,
              getPages: List.of(staticRoutes.entries.map((e) {
                return GetPage(
                    // navigator2 (он же router) ожидает, что маршруты начинаются со слеша "/" (а navigator1 наоборот)
                    name: e.key.startsWith("/") ? e.key : "/" + e.key,
                    page: () {
                      // #TODO: если нужно не показывать страницу без аутентификации,
                      // то эту логику можно написать тут
                      return e.value;
                    });
              })),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                // из-за ошбики "A CupertinoLocalizations delegate that supports the ru locale was not found."
                // по примеру из https://docs.flutter.dev/development/accessibility-and-localization/internationalization
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [Locale('ru')],
              darkTheme: ThemeConsts.darkThemeData.copyWith(
                platform: defaultTargetPlatform,
              ),
            );
          });
    });
  }
}

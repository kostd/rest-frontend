import 'package:get/get.dart';
import 'package:rest_frontend/data/repositories/category_repository_impl.dart';
import 'package:rest_frontend/domain/repositories/category_repository.dart';
import 'package:rest_frontend/presentation/logic/application_cubit.dart';
import 'package:rest_frontend/presentation/logic/auth_cubit.dart';
import 'package:rest_frontend/presentation/logic/menu_cubit.dart';

import 'data/fixtures/category_fixture.dart';

/// место, где задается начальная конфигурация dependency injection
/// Доложно по идее жить в conf, но не может, т.к. зависит от всех-всех
/// "бинов" и их конкретных реализаций.
/// Сделано по образу и подобию инжектора из clean-arch семпла,
/// https://github.com/devmuaz/flutter_clean_architecture/blob/master/lib/src/injector.dart
///
/// #TODO: не нравится, что здесь же происходит инстанциирование и инициализация зависимостей.
/// Для bloc хотелось бы это делать поближе к presentation
void initializeDependencies() {
  // порядок инициализации зависимостей важен, это и так очевидно
  // ********           service layer       ***********************************************
  Get.put(CategoryFixture());
  Get.put<CategoryRepository>(CategoryRepositoryImpl());
  // ********           presentation layer  ***********************************************
  Get.put(ApplicationCubit());
  Get.put(AuthCubit());
  // #TODO:  в примерах инициализация вызывается на страницах, внутри атрибута create у BlocProvider`а
  Get.put(MenuCubit()..init());
}

import 'package:rest_frontend/domain/entities/category.dart';

import '../../domain/entities/dish.dart';

class MenuState {
  final List<Category> categories;

  /// выбранная в ui категория блюд
  final Category selectedCategory;

  /// значение в поле ввода текста. в меню отдаются только блюда, содержащие в названии этот текст
  final String searchText;

  /// блюда, которые отображаются в списке блюд. Если не было фильтрации по searchText, совпадает
  /// с коллекцией блюд у выбранной категории
  final List<Dish> dishes;

  MenuState(
      {required this.categories,
      required this.selectedCategory,
      required this.searchText,
      required this.dishes});

  // https://www.flutterclutter.dev/flutter/basics/clone-copy-objects-in-dart/2020/1851/
  // сейчас надо написать copyWith вручную, а потом мб подключить генератор (например freezed)
  // #TODO: а для toJson есть https://pub.dev/packages/json_serializable и json_annotations
  // #TODO: а еще надо наверное сделать State extends Equtable

  MenuState copyWith(
      {List<Category>? categories,
      Category? selectedCategory,
      String? searchText,
      List<Dish>? dishes}) {
    return MenuState(
        categories: categories ?? this.categories,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        searchText: searchText ?? this.searchText,
        dishes: dishes ?? this.dishes);
  }
}

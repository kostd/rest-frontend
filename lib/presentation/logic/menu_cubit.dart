import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rest_frontend/domain/entities/category.dart';
import 'package:rest_frontend/domain/repositories/category_repository.dart';
import 'package:rest_frontend/presentation/state/menu_state.dart';

import '../../domain/entities/dish.dart';

/// описывает логику представления для фичи "меню".
class MenuCubit extends Cubit<MenuState> {
  final CategoryRepository _categoryRepository = Get.find();

  MenuCubit()
      : super(MenuState(
            categories: List.of({}),
            selectedCategory: Category.emptyCategory,
            searchText: "",
            dishes: List.of({}))) {}

  ///  начальная инициализация.
  Future<void> init() async {
    List<Category> categories = await _categoryRepository.getAllCategories();

    emit(MenuState(
        categories: categories,
        selectedCategory:
            categories.isNotEmpty ? categories.first : Category.emptyCategory,
        searchText: "",
        dishes: categories.isNotEmpty ? categories.first.dishes : List.of({})));
  }

  /// фильтровать блюда по тексту, введенному в поле поиска
  List<Dish> _filterDishes(String searchText, List<Dish> dishes) {
    if (searchText.isEmpty) {
      // всегда возвращаем копию, а не сам объект. Хотя бы для единообразия
      return List.of(dishes);
    }
    return List.of(dishes.where((element) {
      return element.name.toLowerCase().contains(searchText.toLowerCase());
    }));
  }

  /// принять текст, введенный в поле поиска. Отфильтровать отображаемые блюда
  /// по введенному тексту.
  void setSearchText(String searchText) {
    List<Dish> newDishes =
        _filterDishes(searchText, state.selectedCategory.dishes);

    emit(state.copyWith(searchText: searchText, dishes: newDishes));
  }

  /// принять выбор категории меню. Отобразить блюда этой категории
  void selectCategory(Category category) {
    emit(state.copyWith(
        selectedCategory: category,
        dishes: _filterDishes(state.searchText, category.dishes)));
  }
}

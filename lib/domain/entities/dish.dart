import 'dart:core';

/// блюдо, или, иначе, элемент меню ресторана, menuItem
class Dish {
  /// наименование
  final String name;

  /// путь к картинке
  final String? imagePath;

  /// цена
  final int cost;

  /// описание состава
  String? consist;

  /// масса. Сделана строкой, чтобы сразу рядом прописать единицу измерения.
  /// Посмотрим, как быстро понадобятся полноценные единицы измерения.
  String? weight;

  /// расширенное описание блюда.
  String? desc;

  Dish(
      {required this.name,
      required this.cost,
      this.imagePath,
      this.consist,
      this.weight,
      this.desc});
}

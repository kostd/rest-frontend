import 'package:rest_frontend/domain/entities/dish.dart';

class CartState {
  /// карта, в которой ключ -- это блюдо, а значение -- количество таких блюд в корзине
  final Map<Dish, int> dishes;

  /// сколько всего блюд в корзине
  final int totalCount;

  /// общая стоимость Заказа, без скидок
  final int totalAmount;

  CartState(
      {required this.dishes,
      required this.totalAmount,
      required this.totalCount});

  CartState copyWith(
      {Map<Dish, int>? dishes, int? totalCount, int? totalAmount}) {
    return CartState(
        dishes: dishes ?? this.dishes,
        totalAmount: totalAmount ?? this.totalAmount,
        totalCount: totalCount ?? this.totalCount);
  }
}

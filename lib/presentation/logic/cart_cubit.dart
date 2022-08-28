import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_frontend/domain/entities/dish.dart';
import 'package:rest_frontend/presentation/state/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(CartState(
            dishes: Map<Dish, int>.of({}), totalAmount: 0, totalCount: 0));

  /// добавляет в кордину одну штуку данного блюда
  void addToCart(Dish dish) {
    Map<Dish, int> dishes = Map<Dish, int>.of(state.dishes);
    dishes.update(
      dish,
      (value) {
        return value + 1;
      },
      ifAbsent: () {
        // будет первое добавление этого блюда в корзину
        return 1;
      },
    );

    emit(state.copyWith(
        dishes: dishes,
        totalCount: state.totalCount + 1,
        totalAmount: state.totalAmount + dish.cost));
  }

  /// убирает из корзины одну штуку данного блюда
  void removeFromCart(Dish dish) {
    Map<Dish, int> dishes = Map<Dish, int>.of(state.dishes);
    if (!dishes.containsKey(dish)) {
      // #TODO: можно ругаться, если просят удалить отсутствующее в корзине. Но вдруг что-то пошло не так?
    }
    dishes.update(dish, (value) {
      return value - 1;
    });
    if (dishes[dish] == 0) {
      dishes.remove(dish);
    }
    // #TODO: тут ассерт, если меньше нуля

    emit(state.copyWith(
        dishes: dishes,
        totalAmount: state.totalAmount - dish.cost,
        totalCount: state.totalCount - 1));
  }

  /// убирает из корзины все вхождения данного блюда
  void removeAllFromCart(Dish dish) {
    Map<Dish, int> dishes = Map<Dish, int>.of(state.dishes);
    if (!dishes.containsKey(dish)) {
      // #TODO: можно ругаться, если просят удалить отсутствующее в корзине. Но вдруг что-то пошло не так?
    }
    int count = dishes[dish] ?? 0;
    dishes.remove(dish);
    emit(state.copyWith(
        dishes: dishes,
        totalAmount: state.totalAmount - count * dish.cost,
        totalCount: state.totalCount - count));
  }
}

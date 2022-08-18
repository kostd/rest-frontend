import 'package:rest_frontend/domain/entities/category.dart';

import '../../domain/entities/dish.dart';

/// Фикстура (в смысле, набор данных для отладки и тестирования) меню ресторана
/// Используется, когда приложение работает в "демонстрационном режиме"
class CategoryFixture {
  static final Category coldSnacks = Category(
      name: "Холодные закуски",
      desc: "дополнения к основным блюдам",
      iconPath: "images/categories/cold-snacks.png",
      dishes: [
        Dish(
          name: "Паштет из куриной печени с луковым конфитюром",
          cost: 380,
        ),
        Dish(
          name: "Террин из творожного сыра с Горгонзолой и свежими ягодами",
          cost: 380,
        ),
        Dish(
          name: "Лосось маринованный в коньяке с перцем Розе",
          cost: 720,
        ),
        Dish(
          name: "Карпаччо из говядины",
          cost: 550,
        ),
        Dish(
          name: "Ассорти брускетт(3шт)",
          cost: 510,
        ),
        Dish(
          name: "Брускетта с вешенками и маринованным луком(2шт)",
          cost: 270,
        ),
        Dish(
          name: "Брускетта с росбифом и вяленными томатами(2шт)",
          cost: 320,
        ),
        Dish(
          name: "Брускетта с лососем слабой соли и авокадо(2шт)",
          cost: 370,
        ),
      ]);

  static final Category soups = Category(
      name: "Супы",
      desc: "первые блюда",
      iconPath: "images/categories/soups.png",
      dishes: [
        Dish(
          name: "Бульон из петуха с яйцом и домашней лапшой",
          cost: 290,
        ),
        Dish(
          name: "Борщ с говядиной, сметаной и домашним салом",
          cost: 390,
        ),
        Dish(
          name: "Грибной крем-суп",
          cost: 350,
        ),
        Dish(
          name: "Уха с лососем, треской и мидиями (сливки по желанию)",
          cost: 550,
        ),
      ]);

  static final Category hotDishes = Category(
      name: "Горячее",
      desc: "Вторые блюда",
      iconPath: "images/categories/hot-dishes.png",
      dishes: [
        Dish(
            name:
                "Запечённое свиное филе под пармезаном с молодым картофелем и соусом из лесных грибов",
            cost: 690,
            consist:
                "Свинина(шея), картофель отварной, сыр(пармезан), соус (рецепт №1)."),
        Dish(
            name: "Бефстроганов с картофельным пюре и маринованными огурчиками",
            cost: 750,
            consist: "Говядина(вырезка), картофель отварной, корнюшоны."),
        Dish(
            name: "Треска с муссом из сельдерея и соусом Голландез",
            cost: 750,
            consist: "Филе трески, брокколи, сельдерей, соус (рецепт №2)"),
        Dish(
            name: "Утиная грудка с цукини и вишнёвым соусом",
            cost: 950,
            consist: "Филе утки, цукини, батат, соус (рецепт №3)."),
        Dish(
            name: "Филе Миньон с кукурузой гриль и соусом Демиглас",
            cost: 1350,
            consist:
                "Филе Миньона, кукуруза, картофель отварной, соус (рецепт №7)."),
      ]);

  static final Category salads = Category(
      name: "Салаты",
      desc: "Салаты",
      iconPath: "images/categories/salads.png",
      dishes: [
        Dish(
          name: "Оливье с мясом перепела",
          cost: 350,
        ),
        Dish(
          name: "Салат Греческий с сербской Брынзой",
          cost: 490,
        ),
        Dish(
          name: "Цезарь с тёплым цыплёнком",
          cost: 450,
        ),
        Dish(
          name: "Цезарь с тигровыми креветками",
          cost: 610,
        ),
        Dish(
          name: "Микс салат с лососем, цитрусами и хумусовой заправкой",
          cost: 720,
        ),
      ]);

  static final fireDishes = Category(
      name: "Блюда на огне",
      desc: "Мясные и овощные блюда, приготовленные на углях или гриле",
      iconPath: "images/categories/fire-dishes.png",
      dishes: [
        Dish(
          name: "Куриное бедро на углях с томатным соусом",
          cost: 590,
        ),
        Dish(
          name: "Свиная шея на углях с томатным соусом",
          cost: 690,
        ),
        Dish(
          name: "Тушка кальмара на гриле",
          cost: 680,
        ),
        Dish(
          name: "Стейк из филе лосося с соусом Тартар",
          cost: 1200,
        ),
        Dish(
            name: "Овощи гриль",
            cost: 720,
            consist: "Цукини, баклажан, перец болгарский, шампиньоны"),
      ]);

  static final Category pizza = Category(
      name: "Пицца",
      desc: "Пицца из дровяной печи",
      iconPath: "images/categories/pizza.png",
      dishes: [
        Dish(
          name: "Пицца Маргарита",
          cost: 690,
        ),
        Dish(name: "Пицца Пеперонни", cost: 720),
        Dish(
          name: "Пицца Карбонара",
          cost: 820,
        ),
        Dish(
          name: "Пицца 4 сыра",
          cost: 820,
        ),
        Dish(
          name: "Пицца Фермерская",
          cost: 890,
        ),
        Dish(
          name: "Пицца с морепродуктами",
          cost: 890,
        ),
        Dish(
          name: "Пицца с Пармской ветчиной и рукколой",
          cost: 890,
        ),
      ]);

  static final Category pasta = Category(
      name: "Паста",
      desc: "Паста",
      iconPath: "images/categories/pasta.png",
      dishes: [
        Dish(
          name: "Пенне с вешенками и трюфельным маслом",
          cost: 520,
        ),
        Dish(
          name: "Паста Карбонара",
          cost: 540,
        ),
        Dish(
          name: "Лазанья с соусом Болоньезе",
          cost: 580,
        ),
        Dish(
          name: "Феттучини с морепродуктами",
          cost: 620,
        ),
      ]);

  static final Category hotSnacks = Category(
      name: "Горячие закуски",
      iconPath: "images/categories/hot-snacks.png",
      desc: "Горячие дополнения к основным блюдам",
      dishes: [
        Dish(
          name: "Картофельные драники со сметаной",
          cost: 320,
        ),
        Dish(
          name: "Жульен с грибами под сырной корочкой",
          cost: 320,
        ),
        Dish(
          name: "Жульен с курицей и грибами под сырной корочкой",
          cost: 360,
        ),
      ]);

  static final Category bread = Category(
      name: "Хлеб",
      desc: "Хлеб",
      iconPath: "images/categories/bread.png",
      dishes: [
        Dish(
          name: "Хлебная корзина со сливочным маслом",
          cost: 150,
        ),
        Dish(
          name: "Фокачча с соусом песто",
          cost: 300,
        ),
      ]);

  List<Category> getAllCategories() {
    return List.of({
      coldSnacks,
      soups,
      hotDishes,
      salads,
      fireDishes,
      pizza,
      pasta,
      hotSnacks,
      bread
    });
  }
}

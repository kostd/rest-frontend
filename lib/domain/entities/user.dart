/// представление о пользователе на клиенте
/// Помимо каких-то серверных атрибутов (которых пока нет), пользователь
/// характеризуется именем и телефоном (если аутентификация пройдена)
class User {
  final String name;

  final String phone;

  User({required this.name, required this.phone});

  static final User emptyUser = User(name: "", phone: "");
}

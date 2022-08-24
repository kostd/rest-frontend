import 'package:equatable/equatable.dart';

/// представление о пользователе на клиенте
/// Помимо каких-то серверных атрибутов (которых пока нет), пользователь
/// характеризуется именем и телефоном (если аутентификация пройдена)
class User extends Equatable {
  final String name;

  final String phone;

  const User({required this.name, required this.phone});

  static const User emptyUser = User(name: "", phone: "");

  @override
  List<Object?> get props {
    return List.of({name, phone});
  }
}

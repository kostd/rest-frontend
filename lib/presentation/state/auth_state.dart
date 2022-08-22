import '../../domain/entities/user.dart';

class AuthState {
  final User currentUser;

  AuthState({required this.currentUser});
}

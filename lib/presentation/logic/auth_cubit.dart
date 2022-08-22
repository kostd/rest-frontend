import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_frontend/presentation/state/auth_state.dart';

import '../../domain/entities/user.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(currentUser: User.emptyUser));
}

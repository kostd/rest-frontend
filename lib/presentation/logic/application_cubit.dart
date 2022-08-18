import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_frontend/presentation/state/application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState());
}

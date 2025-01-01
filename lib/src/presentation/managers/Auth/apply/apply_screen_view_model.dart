import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_states.dart';

@injectable
class ApplyScreenViewModel extends Cubit<ApplyScreenStates>{
  ApplyScreenViewModel(): super(InitialState());

}
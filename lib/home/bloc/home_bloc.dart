import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_todo/services/authentication.dart';
import 'package:flutter_bloc_todo/services/todo.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Authentication _auth;
  final TodoService _todo;
  HomeBloc(this._auth, this._todo) : super(RegisteringServicesState()) {
    on<LoginEvent>((event, emit) async {
      final user = await _auth.authenticateUser(event.username, event.password);
      if (user != null) {
        emit(SuccessfulLoginState(user));
        emit(HomeInitial());
      }
    });
    on<RegisterAccountEvent>((event, emit) async {
      final result = await _auth.createUser(event.username, event.password);
      switch (result) {
        case UserCreationResult.success:
          emit(SuccessfulLoginState(event.username));
          break;
        case UserCreationResult.failure:
          emit(HomeInitial(error: 'there is error'));
          break;
        case UserCreationResult.already_exists:
          emit(HomeInitial(error: 'User already exist'));
          break;
        default:
      }
      emit(HomeInitial());
    });
    on<RegisterServiceEvent>((event, emit) async {
      await _auth.init();
      await _todo.init();
      emit(HomeInitial());
    });
  }
}

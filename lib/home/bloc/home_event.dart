part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoginEvent extends HomeEvent {
  final String username;
  final String password;
  LoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class RegisterServiceEvent extends HomeEvent {
  // final String username;
  // final String password;
  // RegisterServiceEvent(this.username, this.password);

  @override
  List<Object?> get props => [];
}

part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  HomeInitial();
  @override
  List<Object?> get props => [];
}

class SuccessfulLoginState extends HomeState {
  final String username;
  SuccessfulLoginState(this.username);

  @override
  List<Object?> get props => [];
}

class RegisteringServicesState extends HomeState {
  @override
  List<Object?> get props => [];
}

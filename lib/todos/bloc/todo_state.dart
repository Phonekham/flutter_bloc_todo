part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoadedState extends TodoState {
  final List<Task> tasks;
  final String username;
  TodoLoadedState(this.tasks, this.username);
  @override
  List<Object?> get props => [tasks, username];
}

part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodoEvent extends TodoEvent {
  final String username;
  LoadTodoEvent(this.username);
  @override
  // TODO: implement props
  List<Object?> get props => [username];
}

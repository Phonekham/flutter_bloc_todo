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

class AddTodoEvent extends TodoEvent {
  final String todoText;

  AddTodoEvent(this.todoText);

  @override
  // TODO: implement props
  List<Object?> get props => [todoText];
}

class ToggleTodoEvent extends TodoEvent {
  final String todoTask;

  ToggleTodoEvent(this.todoTask);
  @override
  // TODO: implement props
  List<Object?> get props => [todoTask];
}

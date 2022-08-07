import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_todo/model/task.dart';
import 'package:flutter_bloc_todo/services/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _todoService;
  TodoBloc(this._todoService) : super(TodoInitial()) {
    on<LoadTodoEvent>((event, emit) {
      final todos = _todoService.getTasks(event.username);
      emit(TodoLoadedState(todos));
    });
  }
}

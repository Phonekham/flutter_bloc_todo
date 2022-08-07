import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_todo/services/todo.dart';
import 'package:flutter_bloc_todo/todos/bloc/todo_bloc.dart';

class TodosPage extends StatelessWidget {
  final String username;
  const TodosPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: BlocProvider(
        create: (context) =>
            TodoBloc(RepositoryProvider.of<TodoService>(context))
              ..add(LoadTodoEvent(username)),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoadedState) {
              return ListView(
                  children: state.tasks
                      .map((e) => ListTile(
                            title: Text(e.task),
                            trailing: Checkbox(
                              value: e.completed,
                              onChanged: null,
                            ),
                          ))
                      .toList());
            }
            return Container();
          },
        ),
      ),
    );
  }
}

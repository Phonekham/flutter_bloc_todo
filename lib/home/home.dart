import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_todo/services/authentication.dart';
import 'package:flutter_bloc_todo/services/todo.dart';
import 'package:flutter_bloc_todo/todos/todos.dart';

class LoginPage extends StatelessWidget {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar title'),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
            RepositoryProvider.of<Authentication>(context),
            RepositoryProvider.of<TodoService>(context))
          ..add(RegisterServiceEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessfulLoginState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TodosPage(username: state.username)));
            }
            if (state is HomeInitial) {
              if (state.error != null) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Error"),
                          content: Text(state.error!),
                        ));
              }
            }
          },
          builder: (context, state) {
            // if (state is HomeInitial) {
            return Column(
              children: [
                TextField(
                  controller: usernameField,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: passwordField,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'password'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                          LoginEvent(usernameField.text, passwordField.text),
                        ),
                        child: Text('LOGIN'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(
                            RegisterAccountEvent(
                                usernameField.text, passwordField.text),
                          );
                        },
                        child: Text('REGISTER'),
                      ),
                    )
                  ],
                )
              ],
            );
            // }
            // return Container(
            //   child: Text('text'),
            // );
          },
        ),
      ),
    );
  }
}

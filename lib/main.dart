import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/app/bloc_observer.dart';
import 'package:todo_local_api/todo_local_api.dart';
import 'package:todo_repository/todo_repository.dart';

import 'app/app.dart';

void main() async {
  FlutterServicesBinding.ensureInitialized();

  final todoLocalApi = TodoLocalApi(
    sharedPreferences: await SharedPreferences.getInstance(),
  );

  final todoRepository = TodoRepository(todoApi: todoLocalApi);

  BlocOverrides.runZoned(
    () {
      runApp(App(
        todoRepository: todoRepository,
      ));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_bloc/app/bloc_observer.dart';
import 'package:todo_local_api/todo_local_api.dart';

import 'app/app.dart';

void main() async {
  FlutterServicesBinding.ensureInitialized();

  final todoLocalApi = TodoLocalApi(
    sharedPreferences: await SharedPreferences.getInstance(),
  );

  BlocOverrides.runZoned(
    () {
      runApp(App(
        todoApi: todoLocalApi,
      ));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

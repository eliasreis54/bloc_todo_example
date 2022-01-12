import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/app/bloc_observer.dart';

import 'app/app.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

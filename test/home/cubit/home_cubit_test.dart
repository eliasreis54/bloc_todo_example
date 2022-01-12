import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/home/cubit/home_cubit.dart';

void main() {
  group('HomeCubitTest', () {
    blocTest<HomeCubit, HomeState>(
      'Should update home tab when tab changes',
      build: () => HomeCubit(),
      act: (cubit) => cubit.setTab(HomeTab.stats),
      expect: () => const <HomeState>[
        HomeInitial(tab: HomeTab.stats),
      ],
    );
  });
}

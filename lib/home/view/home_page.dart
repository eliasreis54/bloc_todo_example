import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/home/cubit/home_cubit.dart';
import 'package:todo_bloc/todo_overview/todo_overview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tab = context
        .select((HomeCubit homeCubit) => (homeCubit.state as HomeInitial).tab);

    return Scaffold(
      body: IndexedStack(
        index: tab.index,
        children: const [
          TodoOverviewPage(),
          Center(
            child: Text('Stats page'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                context.read<HomeCubit>().setTab(HomeTab.overview);
              },
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart),
              onPressed: () {
                context.read<HomeCubit>().setTab(HomeTab.stats);
              },
            ),
          ],
        ),
      ),
    );
  }
}

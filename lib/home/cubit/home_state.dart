part of 'home_cubit.dart';

enum HomeTab {
  overview,
  stats,
}

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  final HomeTab tab;

  const HomeInitial({
    this.tab = HomeTab.overview,
  });

  @override
  List<Object> get props => [tab];
}

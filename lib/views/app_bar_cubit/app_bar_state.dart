part of 'app_bar_cubit.dart';

class AppBarState extends Equatable {
  final int currentSelectedAppBar;

  const AppBarState({required this.currentSelectedAppBar});

  AppBarState copyWith(int? newSelectedAppBar) {
    return AppBarState(
      currentSelectedAppBar: newSelectedAppBar ?? currentSelectedAppBar,
    );
  }

  @override
  List<Object?> get props => [
        currentSelectedAppBar,
      ];
}

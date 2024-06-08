import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  final List<AppBarData> _appBars = [
    AppBarData(iconData: Icons.home_rounded, title: 'Home'),
    AppBarData(iconData: Icons.person_2_rounded, title: 'About Me'),
    AppBarData(iconData: Icons.work_history_rounded, title: 'Experience'),
    AppBarData(iconData: Icons.code_rounded, title: 'Projects'),
  ];

  List<AppBarData> get appBarList => [..._appBars];

  late final PageController _pageController;
  PageController get pageController => _pageController;

  AppBarCubit() : super(const AppBarState(currentSelectedAppBar: 0)) {
    _pageController = PageController();
  }

  void setNewAppBar(int newselected) {
    emit(state.copyWith(newselected));
    _pageController.jumpToPage(newselected);

    print('newstate: ${state}');
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}

class AppBarData {
  final IconData iconData;
  final String title;

  AppBarData({required this.iconData, required this.title});
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final List<String> groups = [];
  Future<void> homeCubit(String groupName) async {
    emit(HomeLoading());
    try {
      groups.add(groupName);
      emit(HomeSucsses(groups: List.from(groups)));
    } catch (e) {
      emit(HomeFaliure(errMess: e.toString()));
    }
  }
}

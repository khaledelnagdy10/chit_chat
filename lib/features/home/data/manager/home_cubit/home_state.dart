part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSucsses extends HomeState {
  final List<String> groups;

  HomeSucsses({required this.groups});
}

final class HomeFaliure extends HomeState {
  final String errMess;

  HomeFaliure({required this.errMess});
}

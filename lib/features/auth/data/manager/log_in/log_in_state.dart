part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
final class LogInLoading extends LogInState {}
final class LogInSucsses extends LogInState {}
final class LogInFaliure extends LogInState {}


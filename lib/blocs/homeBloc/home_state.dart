part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeSuccess extends HomeState {
  final List<Employee> employees;
  HomeSuccess(this.employees);
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

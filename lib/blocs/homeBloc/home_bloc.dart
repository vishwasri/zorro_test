import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:zorro_test/exception/http_exceptions.dart';
import 'package:zorro_test/models/employee.dart';
import 'package:zorro_test/util/const.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final employeeRepository;
  HomeBloc(this.employeeRepository) : super(HomeInitial()) {
    on<GetEmployeesEvent>(_getEmployeeHandler);
  }

  FutureOr<void> _getEmployeeHandler(GetEmployeesEvent event, Emitter<HomeState> emit) async{
    try {
      List<Employee> employees = await employeeRepository.getEmployees();
      emit(HomeSuccess(employees));
    } on NoDataFoundException catch(e){
      debugPrint(e.toString());
      emit(HomeError(NO_DATA_FOUND_ERROR_TXT));
    }
  }
}

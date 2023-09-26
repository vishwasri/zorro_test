import 'package:zorro_test/data/emp_data.dart';
import 'package:zorro_test/models/employee.dart';

class EmployeeRepository{

  Future<List<Employee>> getEmployees() async{

    Future.delayed(const Duration(seconds: 2),(){
    });
    return employeeFromJson(empData);
  }
}
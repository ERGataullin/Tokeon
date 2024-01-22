import 'package:tokeon/data/dto/employee.dart';
import 'package:tokeon/data/dto/employee_details.dart';

abstract interface class EmployeeDataSource {
  const EmployeeDataSource();

  Future<List<EmployeeDto>> getEmployees();

  Future<EmployeeDetailsDto> getEmployeeDetails(Object id);

  Future<void> saveEmployee({
    required EmployeeDto employee,
    required EmployeeDetailsDto details,
  });
}

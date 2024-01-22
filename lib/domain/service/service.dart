import 'package:tokeon/domain/models/employee.dart';
import 'package:tokeon/domain/models/employee_details.dart';

abstract class EmployeeService {
  const EmployeeService();

  Future<List<EmployeeData>> getEmployees();

  Future<EmployeeDetailsData> getEmployeeDetails(Object id);

  Future<void> saveEmployee({
    required EmployeeData employee,
    required EmployeeDetailsData details,
  });
}

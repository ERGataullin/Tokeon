import 'package:tokeon/data/dto/employee.dart';
import 'package:tokeon/data/dto/employee_details.dart';
import 'package:tokeon/data/sources/source.dart';

class EmployeeRepository {
  const EmployeeRepository({
    required EmployeeDataSource local,
  }) : _local = local;

  final EmployeeDataSource _local;

  Future<List<EmployeeDto>> getEmployees() async {
    return await _local.getEmployees();
  }

  Future<EmployeeDetailsDto> getEmployeeDetails(Object id) async {
    return await _local.getEmployeeDetails(id);
  }

  Future<void> saveEmployee({
    required EmployeeDto employee,
    required EmployeeDetailsDto details,
  }) async {
    await _local.saveEmployee(
      employee: employee,
      details: details,
    );
  }
}

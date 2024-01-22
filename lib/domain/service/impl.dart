import 'package:tokeon/data/dto/employee.dart';
import 'package:tokeon/data/dto/employee_details.dart';
import 'package:tokeon/data/repository.dart';
import 'package:tokeon/domain/models/employee.dart';
import 'package:tokeon/domain/models/employee_details.dart';
import 'package:tokeon/domain/service/service.dart';

class EmployeeServiceImpl extends EmployeeService {
  const EmployeeServiceImpl({
    required EmployeeRepository repository,
  }) : _repository = repository;

  final EmployeeRepository _repository;

  @override
  Future<List<EmployeeData>> getEmployees() async {
    final List<EmployeeDto> dtos = await _repository.getEmployees();
    return dtos.map(EmployeeData.fromDto).toList(growable: false);
  }

  @override
  Future<EmployeeDetailsData> getEmployeeDetails(Object id) async {
    final EmployeeDetailsDto dto = await _repository.getEmployeeDetails(id);
    return EmployeeDetailsData.fromDto(dto);
  }

  @override
  Future<void> saveEmployee({
    required EmployeeData employee,
    required EmployeeDetailsData details,
  }) async {
    await _repository.saveEmployee(
      employee: EmployeeDto(
        id: employee.id,
        firstName: employee.firstName,
        lastName: employee.lastName,
        middleName: employee.middleName,
        phoneNumber: employee.phoneNumber,
      ),
      details: EmployeeDetailsDto(
        id: details.id,
        email: details.email,
        comment: details.comment,
      ),
    );
  }
}

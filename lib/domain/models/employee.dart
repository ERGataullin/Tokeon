import 'package:tokeon/data/dto/employee.dart';

class EmployeeData {
  const EmployeeData({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.middleName,
    required this.phoneNumber,
  });

  factory EmployeeData.fromDto(EmployeeDto dto) => EmployeeData(
        id: dto.id,
        firstName: dto.firstName,
        lastName: dto.lastName,
        middleName: dto.middleName,
        phoneNumber: dto.phoneNumber,
      );

  final Object id;

  final String firstName;

  final String lastName;

  final String? middleName;

  final String phoneNumber;
}

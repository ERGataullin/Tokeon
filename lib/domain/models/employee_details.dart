import 'package:tokeon/data/dto/employee_details.dart';

class EmployeeDetailsData {
  const EmployeeDetailsData({
    required this.id,
    required this.email,
    this.comment,
  });

  factory EmployeeDetailsData.fromDto(EmployeeDetailsDto dto) =>
      EmployeeDetailsData(
        id: dto.id,
        email: dto.email,
        comment: dto.comment,
      );

  final Object id;

  final String email;

  final String? comment;
}

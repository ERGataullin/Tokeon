class EmployeeDto {
  const EmployeeDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.middleName,
    required this.phoneNumber,
  });

  final Object id;

  final String firstName;

  final String lastName;

  final String? middleName;

  final String phoneNumber;
}

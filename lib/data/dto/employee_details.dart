class EmployeeDetailsDto {
  const EmployeeDetailsDto({
    required this.id,
    required this.email,
    this.comment,
  });

  final Object id;

  final String email;

  final String? comment;
}

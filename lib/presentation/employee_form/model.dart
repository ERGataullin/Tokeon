import 'package:elementary/elementary.dart';
import 'package:tokeon/domain/models/employee.dart';
import 'package:tokeon/domain/models/employee_details.dart';
import 'package:tokeon/domain/service/service.dart';
import 'package:uuid/uuid.dart';

abstract class IEmployeeFormModel implements ElementaryModel {
  set lastName(String value);

  set firstName(String value);

  set middleName(String value);

  set phoneNumber(String value);

  set email(String value);

  set comment(String value);

  void save();
}

class EmployeeFormModel extends ElementaryModel implements IEmployeeFormModel {
  EmployeeFormModel({
    required EmployeeService service,
  }) : _service = service;

  @override
  String lastName = '';

  @override
  String firstName = '';

  @override
  String middleName = '';

  @override
  String phoneNumber = '';

  @override
  String email = '';

  @override
  String comment = '';

  final EmployeeService _service;

  final Uuid _uuid = Uuid();

  @override
  Future<void> save() async {
    final Object id = _uuid.v4();
    final EmployeeData employee = EmployeeData(
      id: id,
      firstName: firstName,
      lastName: lastName,
      middleName: middleName.isEmpty ? null : middleName,
      phoneNumber: phoneNumber,
    );
    final EmployeeDetailsData details = EmployeeDetailsData(
      id: id,
      email: email,
      comment: comment.isEmpty ? null : comment,
    );

    await _service.saveEmployee(
      employee: employee,
      details: details,
    );
  }
}

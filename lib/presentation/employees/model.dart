import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:tokeon/domain/models/employee.dart';
import 'package:tokeon/domain/service/service.dart';

abstract class IEmployeesModel implements ElementaryModel {
  ValueListenable<bool> get loading;

  ValueListenable<List<EmployeeData>> get employees;
}

class EmployeesModel extends ElementaryModel implements IEmployeesModel {
  EmployeesModel({
    required EmployeeService service,
  }) : _service = service;

  @override
  final ValueNotifier<bool> loading = ValueNotifier(false);

  @override
  final ValueNotifier<List<EmployeeData>> employees = ValueNotifier(const []);

  final EmployeeService _service;

  @override
  void init() {
    _loadEmployees();
  }

  @override
  void dispose() {
    super.dispose();
    loading.dispose();
    employees.dispose();
  }

  Future<void> _loadEmployees() async {
    loading.value = true;
    employees.value = await _service.getEmployees();
    loading.value = false;
  }
}

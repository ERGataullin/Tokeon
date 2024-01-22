import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tokeon/domain/models/employee.dart';
import 'package:tokeon/presentation/employees/model.dart';
import 'package:tokeon/presentation/employees/widget.dart';

EmployeesWidgetModel employeesWidgetModelFactory(BuildContext context) {
  return EmployeesWidgetModel(
    EmployeesModel(
      service: context.read(),
    ),
  );
}

abstract interface class IEmployeesWidgetModel implements IWidgetModel {
  ValueListenable<String> get title;

  ValueListenable<bool> get showLoader;

  ValueListenable<List<EmployeeData>> get employees;

  void onAddEmployeePressed();
}

class EmployeesWidgetModel extends WidgetModel<EmployeesWidget, EmployeesModel>
    implements IEmployeesWidgetModel {
  EmployeesWidgetModel(super.model);

  @override
  final ValueNotifier<String> title = ValueNotifier('Список работников');

  @override
  ValueListenable<bool> get showLoader => model.loading;

  @override
  ValueListenable<List<EmployeeData>> get employees => model.employees;

  @override
  void onAddEmployeePressed() {
    widget.onAddEmployeePressed();
  }
}

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:tokeon/presentation/components/employee_tile/model.dart';
import 'package:tokeon/presentation/components/employee_tile/widget.dart';

EmployeeTileWidgetModel employeeTileWidgetModelFactory(BuildContext context) {
  return EmployeeTileWidgetModel(
    EmployeeTileModel(),
  );
}

abstract interface class IEmployeeTileWidgetModel implements IWidgetModel {
  ValueListenable<String> get number;

  ValueListenable<String> get title;

  ValueListenable<String> get phoneNumber;
}

class EmployeeTileWidgetModel
    extends WidgetModel<EmployeeTileWidget, EmployeeTileModel>
    implements IEmployeeTileWidgetModel {
  EmployeeTileWidgetModel(super.model);

  @override
  final ValueNotifier<String> number = ValueNotifier('');

  @override
  final ValueNotifier<String> title = ValueNotifier('');

  @override
  final ValueNotifier<String> phoneNumber = ValueNotifier('');

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    number.value = widget.number.toString();
    title.value = [
      widget.employee.lastName,
      widget.employee.firstName,
      if (widget.employee.middleName != null) widget.employee.middleName,
    ].join(' ');
    phoneNumber.value = widget.employee.phoneNumber;
  }

  @override
  void dispose() {
    super.dispose();
    number.dispose();
    title.dispose();
    phoneNumber.dispose();
  }
}

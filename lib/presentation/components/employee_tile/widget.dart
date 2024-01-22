import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:tokeon/domain/models/employee.dart';
import 'package:tokeon/presentation/components/employee_tile/widget_model.dart';

class EmployeeTileWidget extends ElementaryWidget<EmployeeTileWidgetModel> {
  const EmployeeTileWidget({
    Key? key,
    required this.number,
    required this.employee,
    WidgetModelFactory wmFactory = employeeTileWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final int number;

  final EmployeeData employee;

  @override
  Widget build(IEmployeeTileWidgetModel wm) {
    return ListTile(
      leading: ValueListenableBuilder(
        valueListenable: wm.number,
        builder: (context, number, ___) => Text(number),
      ),
      title: ValueListenableBuilder(
        valueListenable: wm.title,
        builder: (context, title, ___) => Text(title),
      ),
      subtitle: ValueListenableBuilder(
        valueListenable: wm.phoneNumber,
        builder: (context, phoneNumber, ___) => Text(phoneNumber),
      ),
    );
  }
}

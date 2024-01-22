import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokeon/presentation/components/employee_tile/widget.dart';
import 'package:tokeon/presentation/employees/widget_model.dart';

extension _EmployeesContext on BuildContext {
  IEmployeesWidgetModel get wm => read<IEmployeesWidgetModel>();
}

class EmployeesWidget extends ElementaryWidget<EmployeesWidgetModel> {
  const EmployeesWidget({
    Key? key,
    required this.onAddEmployeePressed,
    WidgetModelFactory wmFactory = employeesWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final VoidCallback onAddEmployeePressed;

  @override
  Widget build(IEmployeesWidgetModel wm) {
    return Provider<IEmployeesWidgetModel>.value(
      value: wm,
      child: Scaffold(
        appBar: AppBar(
          title: const _Title(),
          actions: const [
            SizedBox(width: 8),
            _AddEmployeeButton(),
            SizedBox(width: 8),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: wm.showLoader,
          builder: (context, showLoader, ___) => showLoader
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const _EmployeesList(),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.wm.title,
      builder: (context, title, ___) => Text(title),
    );
  }
}

class _AddEmployeeButton extends StatelessWidget {
  const _AddEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: context.wm.onAddEmployeePressed,
    );
  }
}

class _EmployeesList extends StatelessWidget {
  const _EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.wm.employees,
      builder: (context, employees, ___) => ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) => EmployeeTileWidget(
          number: index + 1,
          employee: employees[index],
        ),
      ),
    );
  }
}

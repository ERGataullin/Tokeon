import 'package:flutter/material.dart';
import 'package:tokeon/presentation/employee_form/widget.dart';
import 'package:tokeon/presentation/employees/widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Справочник работников компании',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Builder(
        builder: (context) => EmployeesWidget(
          onAddEmployeePressed: () => showDialog(
            context: context,
            builder: (context) => const Dialog(
              child: EmployeeFormWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

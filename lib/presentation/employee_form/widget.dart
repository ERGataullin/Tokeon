import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokeon/presentation/employee_form/widget_model.dart';

extension _EmployeeFormContext on BuildContext {
  IEmployeeFormWidgetModel get wm => read<IEmployeeFormWidgetModel>();
}

class EmployeeFormWidget extends ElementaryWidget<EmployeeFormWidgetModel> {
  const EmployeeFormWidget({
    Key? key,
    WidgetModelFactory wmFactory = employeeFormWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IEmployeeFormWidgetModel wm) {
    return Provider<IEmployeeFormWidgetModel>.value(
      value: wm,
      child: Scaffold(
        appBar: AppBar(
          title: Text(wm.title),
          actions: const [
            SizedBox(width: 8),
            _SubmitButton(),
            SizedBox(width: 8),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                _Fields(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.wm.onSubmitPressed,
      icon: const Icon(Icons.done),
    );
  }
}

class _Fields extends StatelessWidget {
  const _Fields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Field(
          controller: context.wm.lastNameController,
          label: context.wm.lastNameLabel,
        ),
        const SizedBox(height: 8),
        _Field(
          controller: context.wm.firstNameController,
          label: context.wm.firstNameLabel,
        ),
        const SizedBox(height: 8),
        _Field(
          controller: context.wm.middleNameController,
          label: context.wm.middleNameLabel,
        ),
        const SizedBox(height: 8),
        _Field(
          controller: context.wm.phoneNumberController,
          label: context.wm.phoneNumberLabel,
        ),
        const SizedBox(height: 8),
        _Field(
          controller: context.wm.emailController,
          label: context.wm.emailLabel,
        ),
        const SizedBox(height: 8),
        _Field(
          controller: context.wm.commentController,
          label: context.wm.commentLabel,
        ),
      ],
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}

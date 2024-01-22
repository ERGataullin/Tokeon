import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tokeon/domain/service/service.dart';
import 'package:tokeon/presentation/employee_form/model.dart';
import 'package:tokeon/presentation/employee_form/widget.dart';

EmployeeFormWidgetModel employeeFormWidgetModelFactory(
  BuildContext context,
) {
  return EmployeeFormWidgetModel(
    EmployeeFormModel(
      service: context.read<EmployeeService>(),
    ),
  );
}

abstract interface class IEmployeeFormWidgetModel implements IWidgetModel {
  TextEditingController get lastNameController;

  TextEditingController get firstNameController;

  TextEditingController get middleNameController;

  TextEditingController get phoneNumberController;

  TextEditingController get emailController;

  TextEditingController get commentController;

  String get title;

  String get lastNameLabel;

  String get firstNameLabel;

  String get middleNameLabel;

  String get phoneNumberLabel;

  String get emailLabel;

  String get commentLabel;

  void onSubmitPressed();
}

class EmployeeFormWidgetModel
    extends WidgetModel<EmployeeFormWidget, EmployeeFormModel>
    implements IEmployeeFormWidgetModel {
  EmployeeFormWidgetModel(super.model);

  @override
  final TextEditingController lastNameController = TextEditingController();

  @override
  final TextEditingController firstNameController = TextEditingController();

  @override
  final TextEditingController middleNameController = TextEditingController();

  @override
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  final TextEditingController emailController = TextEditingController();

  @override
  final TextEditingController commentController = TextEditingController();

  @override
  String get title => 'Добавление работника';

  @override
  String get lastNameLabel => 'Фамилия';

  @override
  String get firstNameLabel => 'Имя';

  @override
  String get middleNameLabel => 'Отчество';

  @override
  String get phoneNumberLabel => 'Номер телефона';

  @override
  String get emailLabel => 'Электронная почта';

  @override
  String get commentLabel => 'Комментарий';

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    lastNameController.addListener(_onLastNameChanged);
    firstNameController.addListener(_onFirstNameChanged);
    middleNameController.addListener(_onMiddleNameChanged);
    phoneNumberController.addListener(_onPhoneNumberChanged);
    emailController.addListener(_onEmailChanged);
    commentController.addListener(_onCommentChanged);
  }

  @override
  void onSubmitPressed() {
    model.save();
  }

  @override
  void dispose() {
    super.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    commentController.dispose();
  }

  void _onLastNameChanged() {
    model.lastName = lastNameController.text;
  }

  void _onFirstNameChanged() {
    model.firstName = firstNameController.text;
  }

  void _onMiddleNameChanged() {
    model.middleName = middleNameController.text;
  }

  void _onPhoneNumberChanged() {
    model.phoneNumber = phoneNumberController.text;
  }

  void _onEmailChanged() {
    model.email = emailController.text;
  }

  void _onCommentChanged() {
    model.comment = commentController.text;
  }
}

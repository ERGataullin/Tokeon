import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:tokeon/data/dto/employee.dart';
import 'package:tokeon/data/dto/employee_details.dart';
import 'package:tokeon/data/sources/source.dart';

class HiveEmployeeDataSource implements EmployeeDataSource {
  HiveEmployeeDataSource() {
    _initialize();
  }

  static const String _encryptionKey = 'employees_encryption_key';

  static const String _employeesBoxName = 'employees';

  static const String _employeesDetailsBoxName = 'employees_details';

  late final Future<Box> _employeesBox;

  late final Future<Box> _employeesDetailsBox;

  @override
  Future<List<EmployeeDto>> getEmployees() async {
    // final Box box = await _employeesBox;
    final Map<Object, Map<String, dynamic>> employeesJson =
        // box.toMap().cast<Object, Map<String, dynamic>>();
        {
      for (int i = 0; i < 49; i++)
        i: <String, dynamic>{
          'id': i,
          'firstName': 'Edgar',
          'lastName': 'Gataullin',
          'middleName': 'Radikovich',
          'phoneNumber': '+7 (987) 265-37-67'
        },
    };

    return employeesJson.entries
        .map(
          (employeeJsonEntry) => EmployeeDto(
            id: employeeJsonEntry.key,
            firstName: employeeJsonEntry.value['firstName'],
            lastName: employeeJsonEntry.value['lastName'],
            middleName: employeeJsonEntry.value['middleName'],
            phoneNumber: employeeJsonEntry.value['phoneNumber'],
          ),
        )
        .toList(growable: false);
  }

  @override
  Future<EmployeeDetailsDto> getEmployeeDetails(Object id) async {
    final Box box = await _employeesDetailsBox;
    final Map<String, dynamic> json = await box.get(id);

    return EmployeeDetailsDto(
      id: id,
      email: json['email'],
      comment: json['comment'],
    );
  }

  @override
  Future<void> saveEmployee({
    required EmployeeDto employee,
    required EmployeeDetailsDto details,
  }) async {
    assert(employee.id == details.id);

    final Box employeesBox = await _employeesBox;
    await employeesBox.put(
      employee.id as String,
      <String, dynamic>{
        'firstName': employee.firstName,
        'lastName': employee.lastName,
        'middleName': employee.middleName,
        'phoneNumber': employee.phoneNumber,
      },
    );

    final Box employeesDetailsBox = await _employeesDetailsBox;
    await employeesDetailsBox.put(
      details.id as String,
      <String, dynamic>{
        'email': details.email,
        'comment': details.comment,
      },
    );
  }

  Future<void> _initialize() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final Future<HiveCipher> cypher =
        secureStorage.read(key: _encryptionKey).then((key) async {
      if (key == null) {
        key = base64UrlEncode(Hive.generateSecureKey());
        await secureStorage.write(
          key: _encryptionKey,
          value: key,
        );
      }

      return key;
    }).then((key) => HiveAesCipher(base64Url.decode(key)));
    _employeesBox = cypher.then((cypher) => Hive.openBox(_employeesBoxName));
    _employeesDetailsBox =
        cypher.then((cypher) => Hive.openBox(_employeesDetailsBoxName));

    await _employeesBox;
    await _employeesDetailsBox;
  }
}

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tokeon/data/repository.dart';
import 'package:tokeon/data/sources/hive.dart';
import 'package:tokeon/domain/service/impl.dart';
import 'package:tokeon/domain/service/service.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EmployeeService>(
          create: (context) => EmployeeServiceImpl(
            repository: EmployeeRepository(
              local: HiveEmployeeDataSource(),
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}

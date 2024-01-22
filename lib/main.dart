import 'package:flutter/widgets.dart';
import 'package:tokeon/internal/app.dart';
import 'package:tokeon/internal/app_dependencies.dart';

void main() {
  runApp(
    const AppDependencies(
      child: App(),
    ),
  );
}

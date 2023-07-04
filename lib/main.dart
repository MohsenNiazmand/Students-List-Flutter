import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentlist/ui/home/home_page.dart';

import 'di/injection.dart';
import 'ui/add_student/add_student_form.dart';
import 'data/data.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          inputDecorationTheme:
          const InputDecorationTheme(border: OutlineInputBorder()),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: const Color(0xff16E5A7))),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/employee_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Penggajian Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmployeeListPage(),
    );
  }
}

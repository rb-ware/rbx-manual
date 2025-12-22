import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'manual/view/manual_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('test');
    return MaterialApp(
      title: 'RB X Manual',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      home: const ManualPage(),
    );
  }
}

import 'package:facebookapp_clone/basic_app/login_page.dart';
import 'package:flutter/material.dart';

class BasicApp extends StatelessWidget {
   const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPageScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/views/loginscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'test app',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test_liveness/home_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Flutter Test Liveness",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        motionCount: 3,
      ),
    );
  }
}
// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskkkk_app/features/Add_Task/presentation/view/add_task.dart';
import 'package:taskkkk_app/features/Home/presentation/view/home_view.dart';
import 'package:taskkkk_app/splash.dart';


void main() async  {
 await Hive.initFlutter();
 await Hive.openBox('user');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash()
    );
  }
}

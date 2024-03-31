// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskkkk_app/core/services/local_storage.dart';
import 'package:taskkkk_app/core/theme/theme.dart';
import 'package:taskkkk_app/features/Add_Task/data/task_model.dart';
import 'package:taskkkk_app/splash.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');
  await Hive.openBox<bool>('mode');
  await Hive.openBox('user');
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, box, child) {
        bool darkMode = box.get('darkMode', defaultValue: false);
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(),
          darkTheme: AppThemes.appDarkTheme,
          debugShowCheckedModeBanner: false,
          home: Splash(),
        );
      },
    );
  }
}

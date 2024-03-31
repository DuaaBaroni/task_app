// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskkkk_app/features/Add_Task/data/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box taskBox;
  static String is_Upload = "is_Upload";
  static init() {
    userBox = Hive.box('user');
    taskBox = Hive.box<TaskModel>('task');
  }

  static cachData(key, value) {
    userBox.put(key, value);
  }

  static getCachData(key) {
    return userBox.get(key);
  }

  static cachTask(key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel getTask(key) {
    return taskBox.get(key);
  }
}
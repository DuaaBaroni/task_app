// ignore_for_file: prefer_const_constructors

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/features/Add_Task/data/task_model.dart';
import 'package:taskkkk_app/features/Home/presentation/widget/home_header.dart';
import 'package:taskkkk_app/features/Home/presentation/widget/task_item.dart';
import 'package:taskkkk_app/features/Home/presentation/widget/today_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required int page});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedValue = DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              HomeHeader(),
              Gap(20),
              TodayHeader(),
              Gap(20),
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColor.primary,
                selectedTextColor: Colors.white,
                dayTextStyle: getSmallStyle(color: theme.onSurface),
                dateTextStyle: getBodyStyle(),
                monthTextStyle: getSmallStyle(color: theme.onSurface),
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = DateFormat("dd/MM/yyyy").format(date);
                  });
                },
              ),
              const Gap(20),
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: Hive.box<TaskModel>('task').listenable(),
                  builder: (context, Box<TaskModel> box, child) {
                    List<TaskModel> tasks = [];
                    for (var element in box.values) {
                      if (element.date == _selectedValue) {
                        tasks.add(element);
                      }
                    }
                    if (tasks.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset("assets/empty.json", width: 250),
                             Gap(20),
                             Text("You dont have any tasks yet!"),
                             Text("Add new tasks to make yhour days productive")
                          ],
                        ),
                      );
                    }
                    return ListView.separated(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: UniqueKey(),
                          secondaryBackground: Container(
                            padding: const EdgeInsets.all(20),
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: AppColor.white,
                                ),
                                const Gap(5),
                                Text(
                                  'Delete',
                                  style: getBodyStyle(color: AppColor.white),
                                ),
                              ],
                            ),
                          ),
                          background: Container(
                            padding: const EdgeInsets.all(20),
                            color: Colors.green,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColor.white,
                                ),
                                const Gap(5),
                                Text(
                                  'Complete',
                                  style: getBodyStyle(color: AppColor.white),
                                ),
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              // compete this task with its key
                              box.put(
                                  tasks[index].id,
                                  TaskModel(
                                      id: tasks[index].id,
                                      title: tasks[index].title,
                                      note: tasks[index].note,
                                      date: tasks[index].date,
                                      startTime: tasks[index].startTime,
                                      endTime: tasks[index].endTime,
                                      color: 3,
                                      isComplete: true));
                            } else {
                              box.delete(tasks[index].id);
                            }
                          },
                          child: TaskItem(
                            model: tasks[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(10),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

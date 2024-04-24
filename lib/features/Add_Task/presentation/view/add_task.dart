// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/services/local_storage.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/core/widgets/custom_btn.dart';
import 'package:taskkkk_app/features/Add_Task/data/task_model.dart';
import 'package:taskkkk_app/features/Home/presentation/view/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key, this.model});
  final TaskModel? model;
  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  String? startTime = DateFormat('hh:mm a').format(DateTime.now());
  var endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 30)));
  int color = 0;

  var titleController = TextEditingController();
  var noteController = TextEditingController();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.model?.title);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    startTime = widget.model != null
        ? widget.model?.startTime
        : DateFormat('hh:mm a').format(DateTime.now());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.primary,
            )),
        centerTitle: true,
        title: Text(
          'Add Task',
          style: getTitleStyle(color: AppColor.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: getTitleStyle(),
            ),
            const Gap(5),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: 'Enter Task Title', border: OutlineInputBorder()),
            ),
            const Gap(10),
            Text(
              'Note',
              style: getTitleStyle(),
            ),
            const Gap(5),
            TextFormField(
              controller: noteController,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText: 'Enter Task Note', border: OutlineInputBorder()),
            ),
            const Gap(10),
            Text(
              'Date',
              style: getTitleStyle(),
            ),
            const Gap(5),
            TextFormField(
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(
                      DateTime.now().add(const Duration(days: 365)).year),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      date = DateFormat("dd/MM/yyyy").format(value);
                    });
                  }
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.calendar_month_rounded),
                  hintText: date,
                  hintStyle: getBodyStyle()),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Start Time',
                    style: getTitleStyle(),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Text(
                    'End Time',
                    style: getTitleStyle(),
                  ),
                ),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            startTime = value.format(context);
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon:  Icon(Icons.watch_later_outlined),
                        hintText: startTime,
                        hintStyle: getBodyStyle()),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            endTime = value.format(context);
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        suffixIcon:  Icon(Icons.watch_later_outlined),
                        hintText: endTime,
                        hintStyle: getBodyStyle()),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                Row(
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(3),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  color = index;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: index == 0
                                    ? AppColor.primary
                                    : index == 1
                                        ? AppColor.orange
                                        : AppColor.pink,
                                child: index == color
                                    ? Icon(
                                        Icons.check,
                                        color: AppColor.white,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          )),
                ),
                const Spacer(),
                CustomButton(
                  width: 150,
                  text: 'Add Task',
                  onPressed: () {
                    String id = '${titleController.text}${DateTime.now()}';
                    AppLocalStorage.cachTask(
                        id,
                        TaskModel(
                            id: id,
                            title: titleController.text,
                            note: noteController.text,
                            date: date,
                            startTime: startTime!,
                            endTime: endTime,
                            color: color,
                            isComplete: false));
                    navigateWithReplacement(context, const HomeView(page: 3,));
                  },
                  style: Text(""),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

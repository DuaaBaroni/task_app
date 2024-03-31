// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/core/widgets/custom_btn.dart';
import 'package:taskkkk_app/features/Add_Task/presentation/view/add_task.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: getTitleStyle(),
            ),
            Text(
              'Today',
              style: getTitleStyle(),
            ),
          ],
        ),
        const Spacer(),
        CustomButton(
          text: '+ Add Task',
          onPressed: () {
            navigateTo(context, const AddTaskView());
          },
          width: 140,
          height: 45,
          style: Text(""),
        )
      ],
    );
  }
}

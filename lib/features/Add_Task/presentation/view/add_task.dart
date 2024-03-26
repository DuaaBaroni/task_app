// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/core/widgets/custom_btn.dart';
import 'package:taskkkk_app/features/Upload/view/upload.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              navigateTo(context, UploadView());
            },
            child: Icon(Icons.arrow_back, size: 20)),
        centerTitle: true,
        title: Text("Add Task", style: getTitleStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title", style: getTitleStyle(color: AppColor.black)),
              Gap(5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter title here',
                ),
              ),
              Gap(10),
              Text("Notes", style: getTitleStyle(color: AppColor.black)),
              Gap(5),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your notes',
                ),
              ),
              Gap(10),
              Text("Date", style: getTitleStyle(color: AppColor.black)),
              Gap(5),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '30/5/2023',
                    suffixIcon: Icon(Icons.calendar_month_outlined)),
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Start Time",
                      style: getBodyStyle(color: AppColor.black),
                    ),
                  ),
                  Gap(5),
                  Expanded(
                    child: Text(
                      "End Time",
                      style: getBodyStyle(color: AppColor.black),
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.watch_later_outlined),
                        border: OutlineInputBorder(),
                        hintText: '10:00 am',
                      ),
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.watch_later_outlined),
                        border: OutlineInputBorder(),
                        hintText: '12:00 am  ',
                      ),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color",
                        style: getBodyStyle(color: AppColor.black),
                      ),
                      Gap(5),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.primary,
                          ),
                          Gap(5),
                          CircleAvatar(
                        backgroundColor: AppColor.pink,
                      ),
                       Gap(5),
                       CircleAvatar(
                        backgroundColor: AppColor.orange,
                      ),
                        ],
                      ),
                    ],
                  ),
                  CustomButton(
                      text: "Create Task",
                      onPressed: () {},
                      width: 150,
                      style: "")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

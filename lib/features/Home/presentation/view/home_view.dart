// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:taskkkk_app/core/constants/assets_img.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/core/widgets/custom_btn.dart';
import 'package:taskkkk_app/features/Add_Task/presentation/view/add_task.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("user");
    String path = box.get("image");
    return SafeArea(
      child: Scaffold(
         body: Padding(
           padding: const EdgeInsets.all(17),
           child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Text("Hello, ${box.get("name")} ", style:getTitleStyle()),
                      Gap(3),
                      Text("Have a Nice Day", style:getSmallStyle()),
                     ],
                  ),
                  CircleAvatar(
                       radius: 30,
                        backgroundImage: (box!= null)
                    ? FileImage(File(path)) as ImageProvider
                    : AssetImage(AssetsImg.appUser),
                  ),
                ],
              ),
                Gap(15),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     CustomButton(text: "+Add Task", onPressed: (){
                      navigateTo(context, AddTaskView());
                   }, width: 150, style: getBodyStyle(fontSize: 16)),
                 ],
              ),
            ],
           ),
         )
      ),
    );
  }
}
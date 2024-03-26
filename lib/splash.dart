// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskkkk_app/core/constants/assets_img.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/features/Home/presentation/view/home_view.dart';
import 'package:taskkkk_app/features/Upload/view/upload.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    var box = Hive.box("user");
    bool isUpload = box.get("isUpload") ?? false;
 Future.delayed(const Duration(seconds: 3), (){
    setState(() {
      navigateWithReplacement(context, isUpload? HomeView() :UploadView());
    });
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsImg.appIcon),
              Gap(13),
              Text("Taskati", style: getBodyStyle(color: AppColor.black),
              ),
              Gap(15),
              Text("its time to get organized", style: getSmallStyle(),
              ),
            ],
        ),
      ),
    );
  }
}
// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/services/local_storage.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/features/profile/presentation/view/profile.dart';
import 'package:taskkkk_app/features/profile/presentation/view/profile.dart';


class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();
    name = AppLocalStorage.getCachData('name');
    path = AppLocalStorage.getCachData('image');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name',
              style: getTitleStyle(color: AppColor.primary),
            ),
            Text(
              'Have A Nice Day !',
              style: getSmallStyle( color: AppColor.black
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            navigateTo  (context,  ProfileView());
          },
          child: CircleAvatar(
            radius: 22,
            backgroundImage: path != null
                ? FileImage(File(path!)) as ImageProvider
                : const AssetImage('assets/user.png'),
          ),
        ),
      ],
    );
  }
}


// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskkkk_app/core/services/local_storage.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/features/Upload/view/upload.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Box<bool> modeBox;
  @override
  void initState() {
    super.initState();
    modeBox = Hive.box("mode");
    AppLocalStorage.getCachData(AppLocalStorage.getCachData(name))
        .then((value) {
      setState(() {
        name = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    bool? isDark = modeBox.get("darkmode");
    final theme = Theme.of(context).colorScheme;

    final box = Hive.box('user');
    var darkMode = box.get('darkMode') ?? false;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.primary,
        actions: [
          IconButton(
            onPressed: () {
              box.put('darkMode', !darkMode);
            },
            icon: Icon(
              darkMode ? Icons.dark_mode_rounded : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: Hive.box('user').listenable(),
          builder: (context, box, child) {
            String path = box.get('image') ?? '';
            String? name = box.get('name') ?? '';
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                          radius: 80,
                          backgroundImage: path.isNotEmpty
                              ? FileImage(File(path)) as ImageProvider
                              : const AssetImage('assets/user.png')),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: theme.background,
                              foregroundColor: AppColor.primary,
                              child: const Icon(Icons.camera_alt_rounded)),
                        ),
                      )
                    ],
                  ),
                  Gap(30),
                  Divider(
                    color: AppColor.primary,
                  ),
                  Gap(30),
                  Row(
                    children: [
                      Text(
                        name!,
                        style: getTitleStyle(color: AppColor.primary),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColor.primary,
                          child: CircleAvatar(
                              radius: 17,
                              backgroundColor: theme.background,
                              foregroundColor: AppColor.primary,
                              child: Icon(Icons.edit)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:io';

import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/services/local_storage.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/core/widgets/custom_btn.dart';
import 'package:taskkkk_app/features/Home/presentation/view/home_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late String name;
  late String image;
  @override
  void initState() {
    image = AppLocalStorage.getCachData('image');
    name = AppLocalStorage.getCachData('name');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.dark_mode_rounded,
              //color: AppColors.green ,
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: Image.file(
                    File(image),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/user.png',
                        width: 50,
                      );
                    },
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    await updateProfileImage(context);
                  },
                  child: CircleAvatar(
                    radius: 18,
                    foregroundColor: AppColor.white,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child:  Icon(Icons.camera_alt, color: AppColor.primary,),
                  ),
                ),
              ),
            ],
          ),
          const Gap(30),
          Divider(
            indent: 30,
            endIndent: 30,
            color: AppColor.white,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Text(
                  name,
                  style: getTitleStyle(),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    updateProfileName(context, name);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.grey)),
                    child: Icon(
                      Icons.edit,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Future<dynamic> updateProfileImage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.grey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                height: 50,
                width: double.infinity,
                text: 'Upload From Camera',
                onPressed: () async {
                  await ImagePicker()
                      .pickImage(source: ImageSource.camera)
                      .then((value) {
                    if (value != null) {
                      AppLocalStorage.cachData('image', value.path);
                    }
                  });
                  Navigator.pop(context);
                  navigateWithReplacement(
                      context,
                      const HomeView(
                        page: 3,
                      ));
                },
                style: '',
              ),
              const Gap(20),
              CustomButton(
                height: 50,
                width: double.infinity,
                text: 'Upload From Gallery',
                onPressed: () {},
                style: '',
              )
            ],
          ),
        );
      },
    );
  }

  updateProfileName(context, name) {
    var formkey = GlobalKey<FormState>();
    var textCon = TextEditingController(text: name);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textCon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is found';
                      }
                      return null;
                    },
                    style: getBodyStyle(color: AppColor.primary),
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    width: double.infinity,
                    text: 'Update Name',
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        AppLocalStorage.cachData('name', textCon.text);
                        Navigator.pop(context);
                        navigateWithReplacement(
                            context,
                            const HomeView(
                              page: 3,
                            ));
                      }
                    },
                    style: '',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

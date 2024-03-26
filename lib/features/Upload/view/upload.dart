// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskkkk_app/core/constants/assets_img.dart';
import 'package:taskkkk_app/core/functions/navigation.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/core/widgets/custom_btn.dart';
import 'package:taskkkk_app/features/Add_Task/presentation/view/add_task.dart';
import 'package:taskkkk_app/features/Home/presentation/view/home_view.dart';



String? path;
String name = "";

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("user");
    return Scaffold(
       appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  navigateWithReplacement(context, HomeView());
                  box.put("name", name);
                  box.put("image", path);
                  box.put("isUpload", true);
                } else if (path != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("please enter your name")));
                 
                } else if (path == null && name.isNotEmpty) {
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("please upload your image")));
                
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please Enter Your Name and Upload Your Image")));
                
                }
              },
              child: const Text('Done', style: TextStyle(fontSize: 18)),
              ),
        ],
      ),
       body: Center(
         child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
             CircleAvatar(
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : AssetImage(AssetsImg.appUser),
                    radius: 70,
              ),
             Gap(10),
             CustomButton(text: "Upload from camera", onPressed: (){
                uploadImage(isCamera: true);
             }, 
             width: 270, style: getBodyStyle()
             ),
             Gap(15),
              CustomButton(text: "Upload from gallary", onPressed: (){
                uploadImage(isCamera: false);
              }, width: 270, style: getBodyStyle()
             ),

             Gap(15),
             Divider(),
             Gap(15),
               Padding(
                 padding: const EdgeInsets.all(9),
                 child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Enter Your Name',
                  ),
                 ),
               ),
          ],
         ),
       )
    );
  }
   uploadImage({required bool isCamera}) async {
    final pickedImg = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImg != null) {
     
      setState(() {
        path = pickedImg.path;
      });
  }
}
   }
  
   

 
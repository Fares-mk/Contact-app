import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:space_app/core/resources/color_manager.dart';
import 'package:space_app/core/resources/image_manager.dart';
import 'package:space_app/models/card_data.dart';
import 'package:space_app/models/user_enter_list.dart';
import 'package:space_app/ui/add%20thing/text_input.dart';
import 'package:space_app/ui/home/home_screen.dart';

class AddThing extends StatefulWidget {

  @override
  State<AddThing> createState() => _AddThingState();
}
String userName="User Name";
String email="example@email.com";
String phone="+200000000000";
File? returnderimage;

List<CardData> user=[];
class _AddThingState extends State<AddThing> {
  Future  pickimage() async{
    final  returnimage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnimage==null)return;
    setState(() {
      returnderimage=File(returnimage.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: ColorManager.primary,
        ),

          child: Padding(
            
            padding: EdgeInsets.only(left: 20, top: 18,right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => pickimage() ,
                      child: Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: ColorManager.onprimary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: returnderimage==null?
                        Image.asset(
                          ImageManager.messi,
                          fit: BoxFit.fitHeight,
                          height: 124,
                        )
                        :Image.file(
                          returnderimage!,
                          fit: BoxFit.fitHeight,
                          height: 124,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextInput(inputText: userName),
                          Divider(color: ColorManager.onprimary),
                          TextInput(inputText: email),
                          Divider(color: ColorManager.onprimary),
                          TextInput(inputText: phone),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      userName=value;
                    });
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: ColorManager.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter User Name",
                    hintStyle: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.onprimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.onprimary),
                    ),
                  ),
                ),
                SizedBox(height: 8.38),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      email=value;
                    });
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: ColorManager.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter User Name",
                    hintStyle: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.onprimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.onprimary),
                    ),
                  ),
                ) ,
                SizedBox(height: 8.38),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      phone=value;
                    });
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: ColorManager.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter User Name",
                    hintStyle: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.onprimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.onprimary),
                    ),
                  ),
                ),
                SizedBox(height: 8.38),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        ColorManager.onprimary,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      final  account = CardData(imagePath: returnderimage!,userName: userName, Email: email, Phone: "+2${phone}");
                          UserEnterList.onAdd(account);
                          Navigator.pushNamed(context,HomeScreen.routname);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Enter user",
                        style: TextStyle(color: ColorManager.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );

  }

}

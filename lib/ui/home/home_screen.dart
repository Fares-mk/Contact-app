import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/core/resources/color_manager.dart';
import 'package:space_app/core/resources/image_manager.dart';
import 'package:space_app/models/card_data.dart';
import 'package:space_app/models/user_enter_list.dart';
import 'package:space_app/ui/add%20thing/add_inform.dart';
import 'package:space_app/ui/card%20widget/card_object.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Image.asset(
          ImageManager.routeAppBar,
          fit: BoxFit.fitHeight,
          height: 39,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: UserEnterList.user.isEmpty
            ? Column(
                children: [
                  SizedBox(height: 90),
                  Image.asset(
                    ImageManager.animation,
                    fit: BoxFit.fitHeight,
                    height: 368,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "There is No Contacts Added Here",
                      style: TextStyle(
                        color: ColorManager.onprimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              )
            : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) =>
                  CardObject(UserEnterList.user[index]),
              itemCount: UserEnterList.user.length,
            ),
      ),
      floatingActionButton:UserEnterList.user.length!=6? Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => deleteAll(),
            child: SvgPicture.asset(ImageManager.delete,fit: BoxFit.fitHeight,height: 14,),
            backgroundColor: ColorManager.delete,
          ),
          SizedBox(height: 8,),
          FloatingActionButton(
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context)  {
                return AddThing();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
            ),
            child: Icon(Icons.add),
            backgroundColor: ColorManager.onprimary,
          ),
        ],
      ):   FloatingActionButton(
        onPressed: () => deleteAll(),
        child: SvgPicture.asset(ImageManager.delete,fit: BoxFit.fitHeight,height: 14,),
        backgroundColor: ColorManager.delete,
      ),
    );
  }
  void deleteAll(){
    setState(() {
      UserEnterList.user.clear();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/core/resources/color_manager.dart';
import 'package:space_app/core/resources/image_manager.dart';
import 'package:space_app/models/card_data.dart';
import 'package:space_app/ui/add%20thing/add_inform.dart';
import 'package:space_app/ui/home/home_screen.dart';

import '../../models/user_enter_list.dart';

class CardObject extends StatefulWidget {
  CardData data;
  CardObject(this.data);

  @override
  State<CardObject> createState() => _CardObjectState();
}

class _CardObjectState extends State<CardObject> {
  String userName="";

  String Email="";

  String Phone="";

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Image.file(
            widget.data.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.onprimary,
                ),
                child: Text(
                  widget.data.userName,
                  style: TextStyle(color: ColorManager.primary),
                ),
              ),
              SizedBox(height: 8),
              Container(
                color: ColorManager.onprimary,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImageManager.mail),
                            Text(widget.data.Email),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(ImageManager.phone),
                            Text(widget.data.Phone),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => onDelete(),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                ColorManager.delete,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(8),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(ImageManager.delete),
                                SizedBox(width: 8),
                                Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }

  void onDelete(){
    setState(() {
      Navigator.pushNamed(context, HomeScreen.routname);
      UserEnterList.user.removeLast();
    });
  }
}

import 'package:space_app/models/card_data.dart';

class UserEnterList {
  static List<CardData>user=[];

  static void onAdd(value){
      user.add(value);
  }
}
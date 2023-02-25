import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/features/save_passwords/bloc/passwords_cubit/states.dart';

import '../../data/SQflite.dart';
import '../../view/screens/credit_card_screen/credit_card_screen.dart';
import '../../view/screens/fav_screen/fav_screen.dart';
import '../../view/screens/media_passwords_screen/media_password_screen.dart';
import '../../../../core/passwords_lists.dart';
import '../../view/screens/paypal_screen/paypal_screen.dart';
import '../../view/screens/secure_note_screen/secure_note_screen.dart';
import '../../view/screens/website_passwords_screen/website_password_screen.dart';

class PasswordScreenCubit extends Cubit<PasswordsScreenStates> {
  PasswordScreenCubit(super.PasswordsScreenInitialState);

  static PasswordScreenCubit get(context) => BlocProvider.of(context);

  MySql dbObj = MySql();


  Future<List<Map>> readData() async {
    List<Map> noteResponse = await dbObj.getData("SELECT * FROM notes");
    List<Map> response = await dbObj.getData("SELECT * FROM passwords");
    for (int i = 0; i < response.length; i++)
    {
      if (response[i]["category"] == "Media") {
        PasswordsLists.mediaPasswords.add(response[i]);
        print("============ media");
      } else if (response[i]["category"] == "Website") {
        PasswordsLists.websitePasswords.add(response[i]);
        print("============ website");
      } else if (response[i]["category"] == "Credit") {
        PasswordsLists.creditCardPasswords.add(response[i]);
        print("============ credit");
      } else if(response[i]["category"] == "PayPal"){
        PasswordsLists.paypalPasswords.add(response[i]);
        print("============ paypal");
      }
    }
    for(int i = 0 ; i< noteResponse.length;i++)
    {
      PasswordsLists.secureNote.add(noteResponse[i]);
      print("============== note $i");
    }
    return response;
  }


  List<String> categoryItemLable =
  [
    "Media Passwords",
    "Website Passwords",
    "Secure Note",
    "Credit Card",
    "PayPal",
    "Favourite",
  ];

  List<MaterialColor> categoryItemColor =
  [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.deepPurple
  ];

  List<Widget> categoryItemScreens =
  [
    MediaPasswords(),
    WebSitePasswords(),
    SecureNote(),
    CreditCardPasswords(),
    PaypalPassword(),
    FavouritePasswords()
  ];
}

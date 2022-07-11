import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/states.dart';

import '../../../local_db/SQflite.dart';
import '../../credit_card_screen/credit_card_screen.dart';
import '../../fav_screen/fav_screen.dart';
import '../../media_passwords_screen/media_password_screen.dart';
import '../../paypal_screen/paypal_screen.dart';
import '../../secure_note_screen/secure_note_screen.dart';
import '../../website_passwords_screen/website_password_screen.dart';
import '../lists_of_passwords/passwords_lists.dart';

class PasswordScreenCubit extends Cubit<PasswordsScreenStates> {
  PasswordScreenCubit(super.PasswordsScreenInitialState);

  static PasswordScreenCubit get(context) => BlocProvider.of(context);

  static getScreenHeight(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return screenHeight - statusBarHeight;
  }

  MySql dbObj = MySql();


  Future<List<Map>> readData() async {
    List<Map> response = await dbObj.getData("SELECT * FROM passwords");
    for (int i = 0; i < response.length; i++)
    {
      if (response[i]["category"] == "Media") {
        PasswordsLists.mediaPasswords.add(response[i]);
        print("============ media");
      } else if (response[i]["category"] == "Website") {
        PasswordsLists.websitePasswords.add(response[i]);
        print("============ website");
      } else if (response[i]["category"] == "Note") {
        PasswordsLists.secureNote.add(response[i]);
        print("============ note");
      } else if (response[i]["category"] == "Credit") {
        PasswordsLists.creditCardPasswords.add(response[i]);
        print("============ credit");
      } else if(response[i]["category"] == "PayPal"){
        PasswordsLists.paypalPasswords.add(response[i]);
        print("============ paypal");
      }
    }
    return response;
  }

  onPressFavButton(bool isFavourite)async
  {
    if(isFavourite)
    {

    }
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

  List<MaterialColor> categoryItemColor = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.deepPurple
  ];

  List<Widget> categoryItemScreens = [
    MediaPasswords(),
    WebSitePasswords(),
    SecureNote(),
    CreditCardPasswords(),
    PaypalPassword(),
    FavouritePasswords()
  ];
}

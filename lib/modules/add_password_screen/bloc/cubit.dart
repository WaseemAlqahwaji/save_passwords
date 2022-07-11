import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/add_password_screen/bloc/states.dart';
import '../../../local_db/SQflite.dart';
import '../../passwords_screen/lists_of_passwords/passwords_lists.dart';

class AddPasswordCubit extends Cubit<AddPasswordStates> {
  AddPasswordCubit(AddPasswordStates AddLayoutInitialState) : super(AddLayoutInitialState);

  static AddPasswordCubit get(context) => BlocProvider.of(context);
  String? valueOfDropdownButton;
  MySql dbObj = MySql();

  void onChangedDropDownButton(String value)
  {
    valueOfDropdownButton = value;
    emit(AddPasswordChangeDropdownButtonState());
  }

  Future<void> insertPassword({
    required String category,
    required String email,
    required String password,
  }) async {
    await dbObj
        .insertData(
            "INSERT INTO passwords (category,email,password,status) VALUES ('$category','$email','$password','new')")
        .then((value) async {
      print("inserted done");
      if (category == "Media") {
        PasswordsLists.mediaPasswords = await dbObj.getData("SELECT * FROM passwords WHERE category = 'Media'");
        print(PasswordsLists.mediaPasswords);
      } else if (category == "Website") {
        PasswordsLists.websitePasswords = await dbObj.getData("SELECT * FROM passwords WHERE category = 'Website'");
        print(PasswordsLists.websitePasswords);
      } else if (category == "Note") {
        PasswordsLists.secureNote = await dbObj.getData("SELECT * FROM passwords WHERE category = 'Note'");
        print(PasswordsLists.secureNote);
      } else if (category == "Credit") {
        PasswordsLists.creditCardPasswords = await dbObj.getData("SELECT * FROM passwords WHERE category = 'Credit'");
        print(PasswordsLists.creditCardPasswords);
      } else if (category == "PayPal") {
        PasswordsLists.paypalPasswords = await dbObj.getData("SELECT * FROM passwords WHERE category = 'PayPal'");
        print(PasswordsLists.paypalPasswords);
      }
    });
  }

  String randomString = "";

  String generateRandomString(int length) {
    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();
    return randomString;
  }
}

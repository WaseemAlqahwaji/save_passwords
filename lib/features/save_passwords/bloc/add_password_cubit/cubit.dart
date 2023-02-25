import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/features/save_passwords/bloc/add_password_cubit/states.dart';
import '../../data/SQflite.dart';
import '../../../../core/passwords_lists.dart';

class AddPasswordCubit extends Cubit<AddPasswordStates> {
  AddPasswordCubit(AddPasswordStates AddLayoutInitialState)
      : super(AddLayoutInitialState);

  static AddPasswordCubit get(context) => BlocProvider.of(context);
  String? valueOfDropdownButton;
  MySql dbObj = MySql();
  String emailText = "Email :";
  String emailLable = "Email";
  bool isNote = false;
  IconData emailIcon = Icons.email;
  String buttonLable = "Add Password";

  void onChangedDropDownButton(String value) {
    valueOfDropdownButton = value;
    emit(AddPasswordChangeDropdownButtonState());
    if (value == "Note") {
      emailText = "Note :";
      emailLable = "Note";
      buttonLable = "Add Note";
      emailIcon = Icons.note;
      isNote = true;
      emit(AddPasswordChangeDropDownButtonSecureNote());
    } else {
      emailText = "Email :";
      emailLable = "Email";
      buttonLable = "Add Email";
      emailIcon = Icons.email;
      isNote = false;
      emit(AddPasswordChangeDropDownButtonSecureNote());
    }
  }

  Future<void> insertNote({required category ,required note})async{
    await dbObj.insertData("INSERT INTO notes (category,note,status) VALUES ('$category','$note','new')");
    PasswordsLists.secureNote = await dbObj.getData("SELECT * FROM notes");
    print(PasswordsLists.secureNote);
    print("Add Note done");
  }

  Future<void> insertPassword({
    required String category,
    required String email,
    required String password,
  }) async {
    await dbObj.insertData("INSERT INTO passwords (category,email,password,status) VALUES ('$category','$email','$password','new')").then((value) async {
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
        PasswordsLists.creditCardPasswords = await dbObj
            .getData("SELECT * FROM passwords WHERE category = 'Credit'");
        print(PasswordsLists.creditCardPasswords);
      } else if (category == "PayPal") {
        PasswordsLists.paypalPasswords = await dbObj
            .getData("SELECT * FROM passwords WHERE category = 'PayPal'");
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

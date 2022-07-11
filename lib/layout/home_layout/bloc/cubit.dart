import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/layout/home_layout/bloc/states.dart';
import 'package:sqflite/sqflite.dart';
import '../../../local_db/SQflite.dart';
import '../../../modules/generate_password_screen/generate_password_screen.dart';
import '../../../modules/passwords_screen/passowrds_screen.dart';

class HomelayoutCubit extends Cubit<HomelayoutStates> {
  HomelayoutCubit(super.HomelayoutInitialState);

  static HomelayoutCubit get(context) => BlocProvider.of(context);
  static Database? database;


  MySql dbObj = MySql();
  createDatabase() async
  {
    await dbObj.createDatabase().then((value)
    {
      emit(HomelayoutCreateOpenedDatabaseDone());
    }).catchError((error)
    {
      emit(HomelayoutCreateOpenedDatabaseError());
    });
  }

  int currentIndex = 0;
  void onTapBottomNavBar(int index)
  {
    currentIndex = index;
    emit(HomelayoutOnTapBottomNavBarState());
  }

  List<String> clipPathTitle =
  [
    "Passwords Categories",
    "Generate Password",
  ];

  List<Widget> bottomNavScreens =
  [
    PasswordsScreen(),
    GeneratePassword(),
  ];

  List<String> imagesPaths =
  [
    "assets/images/facebook_image.png",
    "assets/images/twitter_image.png",
    'assets/images/instagram_image.png',
    "assets/images/google_image.png",
    "assets/images/mega_image.png"
  ];

}

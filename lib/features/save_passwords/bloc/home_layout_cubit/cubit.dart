import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/features/save_passwords/bloc/home_layout_cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/SQflite.dart';
import '../../view/screens/generate_password_screen/generate_password_screen.dart';
import '../../view/screens/passwords_screen/passowrds_screen.dart';

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



}

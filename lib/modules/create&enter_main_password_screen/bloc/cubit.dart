import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/create&enter_main_password_screen/bloc/states.dart';


class MainPasswordCubit extends Cubit<MainPasswordStates>{
  MainPasswordCubit(MainPasswordStates initialState) : super(MainPasswordInitialState());

  static MainPasswordCubit get(context) => BlocProvider.of(context);


  String? valueOfVerificationCode;
  String valueOfErrorText = "full all Places";
  bool? onEditingValue;
  Color? errorTextColor = Colors.white;



  void onComplete(String? value)
  {
    valueOfVerificationCode = value;
    print(valueOfVerificationCode);
    emit(MainPasswordCompleteValue());
  }
  void onEditing(bool? value)
  {
    onEditingValue = value;
    print(onEditingValue);
    emit(MainPasswordEditingValue());
  }

  void changeErrorTextColor()
  {
    errorTextColor = Colors.red;
    emit(MainPasswordErrorTextColor());
  }

  void ErrorNotMatched()
  {
    errorTextColor = Colors.red;
    valueOfErrorText = "Not Matched";
    emit(MainPasswordErrorNotMatched());
  }
}
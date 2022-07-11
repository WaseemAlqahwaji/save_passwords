import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/generate_password_screen/bloc/states.dart';

class GeneratePasswordCubit extends Cubit<GeneratePasswordStates>{
  GeneratePasswordCubit(GeneratePasswordStates GeneratePasswordInitialState) : super(GeneratePasswordInitialState);

  static GeneratePasswordCubit get(context) => BlocProvider.of(context);

  double valueOfSlider = 10.0;
  changeSlider(double changedValue)
  {
    valueOfSlider = changedValue;
    emit(GeneratePasswordChangeSlider());
  }
  String randomString = "";
  String generateRandomString(int length)
  {
    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    randomString = List.generate(length, (index) => _availableChars[_random.nextInt(_availableChars.length)]).join();
    return randomString;
  }

}
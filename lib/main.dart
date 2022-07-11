import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:save_passwords/shared/local/cache_helper.dart';
import 'bloc_observer/bloc_observer.dart';
import 'layout/home_layout/bloc/cubit.dart';
import 'layout/home_layout/bloc/states.dart';
import 'modules/add_password_screen/bloc/cubit.dart';
import 'modules/add_password_screen/bloc/states.dart';
import 'modules/create&enter_main_password_screen/bloc/cubit.dart';
import 'modules/create&enter_main_password_screen/bloc/states.dart';
import 'modules/create&enter_main_password_screen/main_screen.dart';
import 'modules/generate_password_screen/bloc/cubit.dart';
import 'modules/generate_password_screen/bloc/states.dart';
import 'modules/onboarding_screens/onboarding_screen.dart';
import 'modules/passwords_screen/bloc/cubit.dart';
import 'modules/passwords_screen/bloc/states.dart';

void main() async {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await CacheHelper.init();
      bool? firstTimeOpeningApp = CacheHelper.getBool(key: 'firstTimeOpening');
      runApp(
        MyApp(firstTimeOpeningApp),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final firstTimeOpeningApp;

  const MyApp(this.firstTimeOpeningApp, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.purple);
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => HomelayoutCubit(HomelayoutInitialState(),)..createDatabase(),),
        BlocProvider(create: (context) => MainPasswordCubit(MainPasswordInitialState(),),),
        BlocProvider(create: (context) => GeneratePasswordCubit(GeneratePasswordInitialState(),),),
        BlocProvider(create: (context) => PasswordScreenCubit(PasswordsScreenInitialState(),)..readData(),),
        BlocProvider(create: (context) => AddPasswordCubit(AddPasswordInitialState(),),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ConditionalBuilder(
          condition: firstTimeOpeningApp == null,
          builder: (context) => OnBoardingScreens(),
          fallback: (context) => MainPassword(),
        ),
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
      ),
    );
  }
}

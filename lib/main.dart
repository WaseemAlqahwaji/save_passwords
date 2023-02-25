import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'features/save_passwords/bloc/create_enter_main_password_cubit/states.dart';
import 'features/save_passwords/bloc/generate_password_cubit/states.dart';
import 'features/save_passwords/bloc/home_layout_cubit/cubit.dart';
import 'features/save_passwords/bloc/home_layout_cubit/states.dart';
import 'features/save_passwords/bloc/add_password_cubit/cubit.dart';
import 'features/save_passwords/bloc/add_password_cubit/states.dart';
import 'features/save_passwords/bloc/create_enter_main_password_cubit/cubit.dart';
import 'features/save_passwords/bloc/passwords_cubit/states.dart';
import 'features/save_passwords/data/cache_helper.dart';
import 'features/save_passwords/view/screens/create&enter_main_password_screen/main_screen.dart';
import 'features/save_passwords/view/screens/onboarding_screens/onboarding_screen.dart';
import 'features/save_passwords/bloc/generate_password_cubit/cubit.dart';
import 'features/save_passwords/bloc/passwords_cubit/cubit.dart';

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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/cubit.dart';
import '../passwords_screen/bloc/states.dart';

class FavouritePasswords extends StatelessWidget {
  const FavouritePasswords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordScreenCubit,PasswordsScreenStates>(
      listener: (context, state){},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Favourite passwords",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "RaleWay",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Text(
            "Favorite Password Screen",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

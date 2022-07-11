import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/cubit.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/states.dart';


import '../../shared/component/components.dart';
import '../add_password_screen/bloc/cubit.dart';
import '../add_password_screen/bloc/states.dart';
import '../passwords_screen/lists_of_passwords/passwords_lists.dart';

class SecureNote extends StatelessWidget {
  const SecureNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordScreenCubit, PasswordsScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PasswordScreenCubit obj = PasswordScreenCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Secure Note",
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "RaleWay",
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: item(
            onTapFav: (value){},

            categoryList: PasswordsLists.secureNote,
          ),
        );
      },
    );
  }
}

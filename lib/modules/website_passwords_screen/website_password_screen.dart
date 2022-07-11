import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/cubit.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/states.dart';
import '../../shared/component/components.dart';
import '../passwords_screen/lists_of_passwords/passwords_lists.dart';

class WebSitePasswords extends StatelessWidget {
  const WebSitePasswords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordScreenCubit, PasswordsScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Website Passwords",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: "RaleWay",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: item(
            onTapFav: (value){},
            categoryList: PasswordsLists.websitePasswords,
          ),
        );
      },
    );
  }
}

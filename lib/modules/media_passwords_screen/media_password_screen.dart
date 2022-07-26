import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/cubit.dart';
import 'package:save_passwords/modules/passwords_screen/bloc/states.dart';
import '../../shared/component/components.dart';
import '../passwords_screen/lists_of_passwords/passwords_lists.dart';

class MediaPasswords extends StatelessWidget {
  const MediaPasswords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordScreenCubit, PasswordsScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Media passwords",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: "RaleWay",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => defaultPasswordItem(
              itemNumber: index + 1,
              email: PasswordsLists.mediaPasswords[index]["email"],
              password: PasswordsLists.mediaPasswords[index]["password"],
            ),
            separatorBuilder: (context, index) => Container(
              color: Colors.grey[300],
              height: 1.0,
              width: double.infinity,
            ),
            itemCount: PasswordsLists.mediaPasswords.length,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/features/save_passwords/bloc/passwords_cubit/cubit.dart';
import 'package:save_passwords/features/save_passwords/bloc/passwords_cubit/states.dart';

import '../../../../../core/passwords_lists.dart';
import '../../../../../utils/components.dart';

class CreditCardPasswords extends StatelessWidget {
  const CreditCardPasswords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordScreenCubit, PasswordsScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Credit Card passwords",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: "RaleWay",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: item(
            onTapFav: (value){},

            categoryList: PasswordsLists.creditCardPasswords,
          ),
        );
      },
    );
  }
}

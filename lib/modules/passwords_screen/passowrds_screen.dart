
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/layout/home_layout/bloc/cubit.dart';

import '../../responsive/responsive.dart';
import '../../shared/component/components.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';
import 'lists_of_passwords/passwords_lists.dart';

class PasswordsScreen extends StatelessWidget {
  const PasswordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordScreenCubit, PasswordsScreenStates>(
      listener: (context, states) {},
      builder: (context, state) {
        PasswordScreenCubit obj = PasswordScreenCubit.get(context);
        PasswordsLists object = PasswordsLists();
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: ResponsiveWidgets.getScreenHeight(context) * 0.250,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return categoryItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return obj.categoryItemScreens[index];
                        },
                      ),
                    );
                  },
                  lable: obj.categoryItemLable[index],
                  color: obj.categoryItemColor[index],
                );
              },
              itemCount: 6,
            ),
          ),
        );
      },
    );
  }
}

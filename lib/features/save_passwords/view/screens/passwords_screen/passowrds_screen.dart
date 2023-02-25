
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/utils/responsive.dart';

import '../../../../../utils/components.dart';
import '../../../bloc/passwords_cubit/cubit.dart';
import '../../../bloc/passwords_cubit/states.dart';

class PasswordsScreen extends StatelessWidget {
  const PasswordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordScreenCubit, PasswordsScreenStates>(
      listener: (context, states) {},
      builder: (context, state) {
        PasswordScreenCubit obj = PasswordScreenCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: Responsive.getScreenHeight(context: context) * 0.250,
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

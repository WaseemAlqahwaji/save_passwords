import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/layout/home_layout/widgets/bottom_nav.dart';
import '../../modules/add_password_screen/add_password_screen.dart';
import '../../responsive/responsive.dart';
import '../../shared/component/components.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  // https://www.youtube.com/watch?v=kBDLOtRNnSo

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomelayoutCubit, HomelayoutStates>(
      listener: (context, states) {},
      builder: (context, states) {
        HomelayoutCubit obj = HomelayoutCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigateTo(
                context: context,
                widget: AddPassword(),
              );
            },
            child: Icon(
              Icons.add,
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: bottomNavigationBar(obj),
          body: Column(
            children:
            [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: ResponsiveWidgets.getScreenHeight(context) * 0.220,
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  color: Colors.purple,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        obj.clipPathTitle[obj.currentIndex],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "RaleWay",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: obj.bottomNavScreens[obj.currentIndex],
              ),
            ],
          ),
        );
      },
    );
  }
}

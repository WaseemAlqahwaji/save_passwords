import 'package:flutter/material.dart';
import '../bloc/cubit.dart';

BottomNavigationBar bottomNavigationBar(HomelayoutCubit obj) => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: obj.currentIndex,
      onTap: (int selectedIndex) {
        obj.onTapBottomNavBar(selectedIndex);
      },
      backgroundColor: Colors.white,
      items:
      [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.key,
          ),
          label: "Generate",
        ),
      ],
      //backgroundColor: Colors.white,
      showUnselectedLabels: false,
    );

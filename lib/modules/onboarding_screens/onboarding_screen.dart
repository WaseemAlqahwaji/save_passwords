import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/component/components.dart';
import '../../shared/local/cache_helper.dart';
import '../create&enter_main_password_screen/main_screen.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final PageController controller = PageController();
  final int onBoardScreenCount = 3;
  bool inLastScreen = false;
  bool moveToNextButton = true;

  // String lableNextButton = "Next";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            bottom: 60.0,
          ),
          child: PageView(
            onPageChanged: (index) {
              // print(index);
              if (onBoardScreenCount - 1 == index) {
                moveToNextButton = false;
              } else {
                moveToNextButton = true;
              }
            },
            physics: BouncingScrollPhysics(),
            controller: controller,
            children: [
              defaultPageOnBoard(
                imagePath: "assets/images/onboard_first_image.png",
                lable: "This app allows you save all your password to keep your accounts with you",
                title: "Save Your Passwords!",
              ),
              defaultPageOnBoard(
                imagePath: "assets/images/onboard_second_image.png",
                lable: "You can generate strong random passwords and use it",
                title: "Random Passwords!",
              ),
              defaultPageOnBoard(
                imagePath: "assets/images/onboard_forth_image.png",
                lable: "This Password keep it well because you will need it every time you will use the app",
                title: "Create Main Password",
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 60.0,
        // color: Colors.purple,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ConditionalBuilder(
                condition: !inLastScreen,
                fallback: (context) => SizedBox(),
                builder: (context) => defaultButtonOnBoard(
                  lable: "Skip",
                  onPress: () {
                    controller.animateToPage(
                      onBoardScreenCount,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      inLastScreen = true;
                    });
                  },
                ),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: onBoardScreenCount,
                effect: WormEffect(
                  spacing: 10,
                  dotColor: Colors.black26,
                  dotHeight: 7.0,
                  dotWidth: 10.0,
                  activeDotColor: Colors.purple,
                ),
              ),
            ),
            Expanded(
              child: defaultButtonOnBoard(
                lable: "Next",
                onPress: () {
                  if (moveToNextButton) {
                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    CacheHelper.setBool(key: "firstTimeOpening", value: false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPassword(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

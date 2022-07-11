import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:save_passwords/local_db/SQflite.dart';


MySql dbObj = MySql(); 
Widget defaultPageOnBoard({
  required String imagePath,
  required String title,
  required String lable,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 100.0,
            alignment: Alignment.topCenter,
            width: double.infinity,
            color: Colors.purple,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(
              imagePath,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'RaleWay',
            fontSize: 25.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            lable,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'RaleWay',
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );

Widget defaultButtonOnBoard({
  required VoidCallback onPress,
  required String lable,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        // width: 40.0,
        height: 35.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 2.0, color: Colors.purple, offset: Offset(0, 1)),
          ],
          color: Colors.purple,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: MaterialButton(
          onPressed: onPress,
          child: Text(
            lable,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );

Widget defaultButton({
  required VoidCallback? onPressed,
  required Color buttonColor,
  required String buttonText,
  Color buttonTextColor = Colors.purple,
  double buttonHeight = 40.0,
  double buttonRadius = 20.0,
  double buttonWidth = 50.0,
}) =>
    Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            color: buttonColor,
            offset: Offset(0, 1),
          ),
        ],
        color: buttonColor,
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor,
          ),
        ),
      ),
    );

Widget defaultTextForm({
  bool clickable = false,
  GestureTapCallback? onTap,
  bool autoFocus = false,
  required TextEditingController controller,
  required TextInputType keyboardType,
  FormFieldValidator<String>? validator,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  required IconData prefixIcon,
  IconData? suffixIcon,
  VoidCallback? onPressSuffixIcon,
  Color? suffixIconColor,
  String lableText = "Any",
  Color lableTextColor = Colors.lightBlueAccent,
  bool isPassword = false,
  Color prefixIconColor = Colors.blue,
  double focusErrorBorder = 15.0,
  Color focusErrorColorBorder = Colors.red,
  double focusErrorWidthBorder = 1.5,
  double errorBorder = 15.0,
  Color errorColorBorder = Colors.red,
  double errorWidthBorder = 1.5,
  double enabledBorder = 25.0,
  double enabledWidthBorder = 1.5,
  Color enableColorBorder = Colors.black54,
  double focusBorder = 15.0,
  Color focusColorBorder = Colors.blue,
  double focusWidthBorder = 1.5,
}) =>
    TextFormField(
      enabled: clickable,
      onChanged: onChange,
      onTap: onTap,
      autofocus: autoFocus,
      validator: validator,
      controller: controller,
      onFieldSubmitted: onSubmit,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onPressSuffixIcon,
          icon: Icon(
            suffixIcon,
            color: suffixIconColor,
          ),
        ),
        labelText: lableText,
        labelStyle: TextStyle(
          color: lableTextColor,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(focusErrorBorder),
          borderSide: BorderSide(
            color: focusErrorColorBorder,
            width: focusErrorWidthBorder,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(errorBorder),
          borderSide: BorderSide(
            color: errorColorBorder,
            width: errorWidthBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(enabledBorder),
          borderSide: BorderSide(
            color: enableColorBorder,
            width: enabledWidthBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(focusBorder),
          borderSide: BorderSide(
            color: Colors.purple,
            width: focusWidthBorder,
          ),
        ),
      ),
    );

Widget defaultPasswordItem({
  required int itemNumber,
  required String email,
  required String password,
  required onTapFav
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 35.0,
              child: Text(
                "$itemNumber",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  password,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          FavoriteButton(
            valueChanged: onTapFav,
            iconDisabledColor: Colors.grey,
            iconColor: Colors.purple,
            iconSize: 60.0,
          ),
        ],
      ),
    );

Widget categoryItem({
  required String lable,
  required MaterialColor color,
  required VoidCallback onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lable,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "RaleWay",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget item({
  required List categoryList,
  required onTapFav
}) =>
    ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => defaultPasswordItem(
        onTapFav: onTapFav,
        itemNumber: index + 1,
        email: categoryList[index]["email"],
        password: categoryList[index]["password"],
      ),
      separatorBuilder: (context, index) => Container(
        color: Colors.grey[300],
        height: 1.0,
        width: double.infinity,
      ),
      itemCount: categoryList.length,
    );

void navigateTo({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

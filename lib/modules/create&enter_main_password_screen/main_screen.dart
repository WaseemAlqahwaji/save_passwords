import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../layout/home_layout/home_layout.dart';
import '../../shared/component/components.dart';
import '../../shared/local/cache_helper.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

class MainPassword extends StatelessWidget {
  const MainPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<MainPasswordCubit, MainPasswordStates>(
            listener: (context, state) {},
            builder: (context, state) {
              MainPasswordCubit obj = MainPasswordCubit.get(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CacheHelper.getBool(key: "isHaveMainPassword") == null ? 'Create Your Main Password' : "Enter Your Main Password ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  VerificationCode(
                    cursorColor: Colors.purple,
                    length: 4,
                    underlineColor: Colors.teal,
                    onEditing: (bool value)
                    {
                      obj.onEditing(value);
                      if (obj.onEditingValue == false)
                        FocusScope.of(context).unfocus();
                    },
                    onCompleted: (String value)
                    {
                      obj.onComplete(value);
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    obj.valueOfErrorText,
                    style: TextStyle(
                      color: obj.errorTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    buttonRadius: 30.0,
                    buttonWidth: 100.0,
                    buttonColor: Colors.purple,
                    buttonText: CacheHelper.getBool(key: "isHaveMainPassword") == null ? "Create" : "Enter",
                    buttonTextColor: Colors.white,
                    onPressed: ()
                    {
                      if (obj.onEditingValue == false)
                      {
                        AlertDialog alertDialog = AlertDialog(
                        title: Text("Be Careful",textAlign: TextAlign.center,),
                        content: Container(
                          width: 200.0,
                          height: 100.0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                              [
                                Text(
                                    "This is your password : ${obj.valueOfVerificationCode}"
                                ),
                                SizedBox(height: 10.0,),
                                Text(
                                  "Don't forget it",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 0.0,
                                  ),
                                ),
                                defaultButton(
                                  onPressed: ()
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPassword()));
                                  },
                                  buttonColor: Colors.purple,
                                  buttonText: "Start App",
                                  buttonTextColor: Colors.white,
                                  buttonWidth: 120.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                        if (CacheHelper.getString(key: "mainPassword") == null)
                        {
                          CacheHelper.setBool(key: "isHaveMainPassword", value: true,);
                          CacheHelper.setString(key: "mainPassword", value: obj.valueOfVerificationCode!,);
                          showDialog(context: context, builder: (context) => alertDialog);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => alertDialog),);
                        } else {
                          if (CacheHelper.getString(key: "mainPassword") == obj.valueOfVerificationCode) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLayout(),),);
                          } else {
                            obj.ErrorNotMatched();
                          }
                        }
                      } else {
                        obj.changeErrorTextColor();
                      }
                    },

                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_passwords/features/save_passwords/bloc/add_password_cubit/cubit.dart';
import 'package:save_passwords/features/save_passwords/bloc/add_password_cubit/states.dart';

import '../../../../../utils/components.dart';


class AddPassword extends StatelessWidget {
  const AddPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    SizedBox allSizedBox = SizedBox(height: 20.0,);

    return BlocConsumer<AddPasswordCubit, AddPasswordStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AddPasswordCubit obj = AddPasswordCubit.get(context);
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Add New Password",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "RaleWay",
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 15.0),
                              child: Text(
                                "Category : ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: "RaleWay",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DropdownButton(
                              value: obj.valueOfDropdownButton,
                              hint: Text("Select Category"),
                              items:
                              [
                                DropdownMenuItem(
                                  child: Text(
                                    "Media Passwords",
                                  ),
                                  value: "Media",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Website Passwords",
                                  ),
                                  value: "Website",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Secure Note",
                                  ),
                                  value: "Note",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Credit Card",
                                  ),
                                  value: "Credit",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "PayPal",
                                  ),
                                  value: "PayPal",
                                ),
                              ],
                              onChanged: (value) {
                                obj.onChangedDropDownButton(value.toString());
                              },
                            ),
                          ],
                        ),
                      ),
                      allSizedBox,
                      Row(
                        children:
                        [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 15.0),
                            child: Text(
                              obj.emailText,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "RaleWay",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: defaultTextForm(
                              lableText: obj.emailLable,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: obj.emailIcon,
                              clickable: true,
                              prefixIconColor: Colors.purple,
                              lableTextColor: Colors.purple,
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Email must be not empty";
                                }
                                return null;
                              }),
                            ),
                          ),
                        ],
                      ),
                      allSizedBox,
                      Row(
                        children:
                        [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 15.0),
                            child: Text(
                              "Password : ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "RaleWay",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: defaultTextForm(
                              lableText: "Password",
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: Icons.password,
                              clickable: !obj.isNote,
                              prefixIconColor: Colors.purple,
                              lableTextColor: Colors.purple,
                              suffixIcon: Icons.edit,
                              suffixIconColor: Colors.purple,
                              onPressSuffixIcon: () {
                                passwordController.text = obj.generateRandomString(8);
                              },
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Password must be not empty";
                                }
                                return null;
                              }),
                            ),
                          ),
                        ],
                      ),
                      allSizedBox,
                      Center(
                        child: defaultButton(
                          onPressed: () async {
                            if(obj.isNote && obj.valueOfDropdownButton == "Note")
                            {
                              await obj.insertNote(
                                category: obj.valueOfDropdownButton!,
                                note: emailController.text,
                              ).then((value)
                              {
                                flutterToast(message: "Adding note done",);
                                Navigator.pop(context);
                              }).catchError((error)
                              {
                                print("error while inserting note $error");
                              });
                            } else if(formKey.currentState!.validate() && obj.valueOfDropdownButton != null) // try do note condition
                            {
                              await obj.insertPassword(
                                category: obj.valueOfDropdownButton!,
                                email: emailController.text,
                                password: passwordController.text,
                              ).then((value)
                              {
                                flutterToast(message: "Adding password done",);
                                Navigator.pop(context);
                              }).catchError((error)
                              {
                                print("error while inserting password $error");
                              });
                            }
                            print(obj.isNote);
                          },
                          buttonColor: Colors.purple,
                          buttonTextColor: Colors.white,
                          buttonText: obj.buttonLable,
                          buttonWidth: 140.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

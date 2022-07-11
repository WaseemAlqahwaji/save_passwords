import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'bloc/cubit.dart';
import 'bloc/states.dart';

class GeneratePassword extends StatelessWidget {
  const GeneratePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneratePasswordCubit, GeneratePasswordStates>(
      listener: (context, states) {},
      builder: (context, state) {
        GeneratePasswordCubit obj = GeneratePasswordCubit.get(context);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Slider(
                divisions: 10,
                label: "${obj.valueOfSlider.round()}",
                max: 18.0,
                min: 8.0,
                value: obj.valueOfSlider,
                onChanged: (double changedValue) {
                  obj.changeSlider(changedValue);
                  print(obj.valueOfSlider.round());
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Generated Password : ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${obj.generateRandomString(obj.valueOfSlider.round())}",
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Clipboard.setData(ClipboardData(
                          text: obj.randomString,
                        ));
                        await Fluttertoast.showToast(
                          msg: "Copied",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 12.0,
                        );
                      },
                      child: Icon(
                        Icons.copy,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

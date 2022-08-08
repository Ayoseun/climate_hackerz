import 'package:climate_hackerz/provider/auth_provider.dart';
import 'package:climate_hackerz/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_route.dart';
import '../shared/local_db.dart';

class RegisterUtil {
  static Future register(GlobalKey<FormState> formkey, BuildContext context,
      Map<String, dynamic> data) async {
    if (formkey.currentState!.validate()) {
      AppUtils.showLoader(context);
      formkey.currentState!.save();

      Provider.of<AuthProvider>(context, listen: false)
          .register(data['email'], data['password'], 'false')
          .then((value) async {
        Navigator.of(context).pop();
       
        print(value);
        print(value['_id']);
      
        if (value!=null) {
           await UserPrefrences.saveID(value['_id']);
          
            AppUtils.singleDialog(
            context,
            const Icon(
              Icons.check_circle_outline,
              color: Color.fromARGB(255, 2, 140, 43),
            ),
           "Registration successful",
            'Proceed',
            () {
              Navigator.of(context, rootNavigator: true)
                  .pushReplacementNamed(AppRoutes.personaldetails);
            },
          );
        } else if (value == null) {
          AppUtils.showAlertDialog(
            context,
            const Icon(
              Icons.error,
              size: 24,
            ),
            'Signup failed',
            'Login instead',
            'Change details',
            () {
              Navigator.of(context).pop();
              Navigator.pushNamed(
                context,
                AppRoutes.login,
              );
              // Storage.balance(value['data']['token']);
            },
          );
        } else {
          AppUtils.showErrorDialog(
            context,
            'Error',
            'An error occured',
            'Cancel',
          );
        }
      });
    }
  }
}

import 'package:climate_hackerz/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_route.dart';
import '../provider/auth_provider.dart';

import '../shared/local_db.dart';
import 'get_balance.dart';

class LoginUtil {


  static Future login(GlobalKey<FormState> formkey, BuildContext context,
      Map<String, dynamic> data) async {
    var show = await IsKYC().getOnce();
    await UserPrefrences.saveEmail(data['email']);
    final Map<String, dynamic> serverErrorResult = {
      'status': false,
      'message': 'Sorry, something went wrong. Contact the Admin',
    };

    if (formkey.currentState!.validate()) {
      AppUtils.showLoader(context);
      formkey.currentState!.save();
      Provider.of<AuthProvider>(context, listen: false)
          .login(data['email'], data['password'])
          .then((value) async {
        Navigator.of(context).pop();
        print(value);
        if (value['isKYCDone'] == 'true') {
          var address = value['address'];
          var privateKey = value['privateKey'];
          var phrase = value['mnemonics'].toString();
          print(phrase);
          await UserPrefrences.saveName(value['name']);
          await UserPrefrences.saveSurname(value['surname']);
          await UserPrefrences.saveUsername(value['username']);
          await UserPrefrences.saveAddress(address);
          await UserPrefrences.saveID(value['_id']);
          await UserPrefrences.savePrivateKey(privateKey);
          await UserPrefrences.savePhrase(phrase);
          IsFirstTime().once(2);
          BalanceUtil.balance(context);
          Navigator.pushNamed(
            context,
            AppRoutes.navBar,
          );
        } else if (value['isKYCDone'] == 'false') {
          AppUtils.singleDialog(
              context,
              const Icon(
                Icons.error,
                size: 24,
              ),
              'You need to complete your details',
              'Proceed to KYC',
              () => Navigator.pushNamed(
                    context,
                    AppRoutes.personaldetails,
                  ));

          // Storage.balance(value['data']['token']);

        } else if (value == null) {
          AppUtils.showAlertDialog(
            context,
            const Icon(
              Icons.error,
              size: 24,
            ),
            'You need to signup',
            'SignUP',
            'Change details',
            () {
              Navigator.of(context).pop();
              Navigator.pushNamed(
                context,
                AppRoutes.verifyOTP,
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

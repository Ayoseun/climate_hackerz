import 'dart:convert';

import 'package:climate_hackerz/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_route.dart';
import '../network/auth.dart';
import '../provider/auth_provider.dart';

import '../provider/user_provider.dart';
import '../shared/local_db.dart';

class GenerateUtil {


  static Future generate(
    BuildContext context,
  ) async {
    final Map<String, dynamic> serverErrorResult = {
      'status': false,
      'message': 'Sorry, something went wrong. Contact the Admin',
    };

    AppUtils.showLoader(context);
    Provider.of<UserProvider>(context, listen: false)
        .generate()
        .then((value) async {
      Navigator.of(context).pop();

      if (value != null) {
        print(value);
        var address = value['message']['address'];
        var privateKey = value['message']['privateKey'];
        var phrases = value['message']['mnemonic'];

        await UserPrefrences.saveAddress(address);
        await UserPrefrences.savePrivateKey(privateKey);
        await UserPrefrences.savePhrase(phrases.toString());

      var response = await AuthAPI.saveWallet(address, phrases, privateKey);
      var responseData = json.decode(response.body);
     
  

        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.createWallet, (route) => false);
      } else {
        AppUtils.singleDialog(context, Icon(Icons.error_rounded),
            'error occured', 'Try again', () => Navigator.of(context).pop());
      }
    });
  }
}

import 'dart:convert';

import 'package:climate_hackerz/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_route.dart';
import '../network/auth.dart';
import '../provider/auth_provider.dart';

import '../provider/user_provider.dart';
import '../shared/local_db.dart';

class BalanceUtil {


  static Future balance(
    BuildContext context,
  ) async {
    final Map<String, dynamic> serverErrorResult = {
      'status': false,
      'message': 'Sorry, something went wrong. Contact the Admin',
    };

  
    Provider.of<UserProvider>(context, listen: false)
        .balance()
        .then((value) async {
    

      if (value != null) {
        var bal = value['balance'];
       

        await UserPrefrences.saveBalance(bal);
       


     
  

      } else {
        AppUtils.singleDialog(context, Icon(Icons.error_rounded),
            'error occured', 'Try again', () => Navigator.of(context).pop());
      }
    });
  }
}

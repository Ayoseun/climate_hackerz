import 'package:climate_hackerz/shared/gift.dart';
import 'package:climate_hackerz/shared/success.dart';
import 'package:climate_hackerz/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_route.dart';
import '../provider/auth_provider.dart';

import '../provider/user_provider.dart';
import '../shared/local_db.dart';


class FundUtil {
  static var status1 = false;

  static Future fund( BuildContext context,
      ) async {
  

      Provider.of<UserProvider>(context, listen: false)
          .fund()
          .then((value) {
            
       if (value["Data"]["hash"]!=null) {
         Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FreeItem()));
       // Success(head: 'Asawelcomebonus', body: 'Youhaverecievedfree10EKOTOKENvalidfor2weeks', buttonText: 'Welcome')));
          print(value);
       } else {
         
       }
        print(value);
    
      });
      
    }
  }


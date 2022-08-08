import 'package:climate_hackerz/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../component/button.dart';
import '../constants/app_fonts.dart';
import '../constants/app_route.dart';
import '../provider/auth_provider.dart';
import '../shared/local_db.dart';

class KYCUtil {
  static Future kyc(GlobalKey<FormState> formkey, BuildContext context,
      Map<String, dynamic> data) async {
    final Map<String, dynamic> serverErrorResult = {
      'status': false,
      'message': 'Sorry, something went wrong. Contact the Admin',
    };

    if (formkey.currentState!.validate()) {
      AppUtils.showLoader(context);

      formkey.currentState!.save();
      Provider.of<AuthProvider>(context, listen: false)
          .KYC(
        data['firstName'],
        data['lastName'],
        data['gender'],
        data['termsAccepted'],
        data['phone'],
        data['username'],
        data['city'],
        data['state'],
      )
          .then((value) async{
        //print(value);
        Navigator.of(context).pop();
        if (value['isKYCDone'] == 'true') {
 await UserPrefrences.saveName(value['name']);
  await UserPrefrences.saveSurname(value['surname']);
  await UserPrefrences.saveUsername(value['username']);

           Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.id, (route) => false);
        //   showModalBottomSheet(
        //     shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.vertical(
        //         top: Radius.circular(25.0),
        //       ),
        //     ),
        //     context: context,
        //     builder: (context) {
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //         child: Container(
        //             height: 300,
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 Text("Account Created Successfully",
        //                     textAlign: TextAlign.center, style: AppFonts.h2),
        //                 Text("You now have an account with Trafiat",
        //                     textAlign: TextAlign.center,
        //                     style: AppFonts.bodylight),
        //                 Button(
        //                     text: 'Proceed'.toUpperCase(),
        //                     onPressed: AppRoutes.navBar)
        //               ],
        //             )),
        //       );
        //     },
        //   );
         } else if (value['isKYC'] != 'true') {
          AppUtils.showAlertDialog(
            context,
            const Icon(Icons.error),
            'You did not accept terms and condition',
            'Login instead',
            'Change details',
            () {
              Navigator.of(context).pop();
            },
          );
        }
      });
    }
  }
}

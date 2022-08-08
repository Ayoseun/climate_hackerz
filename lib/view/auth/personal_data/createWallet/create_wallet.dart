import 'package:climate_hackerz/component/button.dart';
import 'package:climate_hackerz/utils/fund_wallet_util.dart';
import 'package:climate_hackerz/utils/get_balance.dart';
import 'package:flutter/material.dart';

import '../../../../component/input.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_route.dart';
import '../../../../shared/local_db.dart';

class DisplayWallet extends StatefulWidget {
  DisplayWallet({Key? key}) : super(key: key);

  @override
  State<DisplayWallet> createState() => _DisplayWalletState();
}

class _DisplayWalletState extends State<DisplayWallet> {
  String phrase = '';
  String address = '';
  String pKey = '';
  check() async {
   var mAddress = await UserPrefrences.showAddress();
   var mPhrase = await UserPrefrences.showPhrase();
   var mPKey = await UserPrefrences.showPrivateKey();
   setState(() {
     phrase=mPhrase;
     pKey=mPKey;
     address=mAddress;
   });
  }

  @override
  void initState() {

      check();
     
 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
       check();
    });
   
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 3 of 3',
                    style: AppFonts.body1,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Personal Details',
                    style: AppFonts.body1.copyWith(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: _getSize.width,
              height: 0.5,
              color: Pallete.kSecondaryColor,
            ),
            SizedBox(
              height: _getSize.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wallet Address:',
                    style: AppFonts.body1.copyWith(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    address,
                    style: AppFonts.body1.copyWith(
                      fontSize: 14,
                      color: Pallete.kText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _getSize.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Private key:',
                    style: AppFonts.body1.copyWith(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    pKey,
                    style: AppFonts.body1.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _getSize.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seed-Phrase/Mnemonics:',
                    style: AppFonts.body1.copyWith(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Pallete.kText.withOpacity(0.04),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        phrase,
                        style: AppFonts.body1.copyWith(
                          fontSize: 18,
                          color: Pallete.kText,
                        ),
                      ),
                    ),
                  ),
                  CustomTextSpan(
                      Pallete.kBlack,
                      AppRoutes.policy,
                      "Keep your seed phrase safe and private because anyone with your phrase or private-key can access your account, read our ",
                      'Memo document',
                      ' for more information.'),
                ],
              ),
            ),    SizedBox(
              height: _getSize.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonWithFuction(
                  text: 'All done now, Enter your account.',
                  onPressed: () {

                   FundUtil.fund(context);
                     IsFirstTime().once(2);
                   // Navigator.of(context).pushNamedAndRemoveUntil(
                       // AppRoutes.navBar, (route) => false);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

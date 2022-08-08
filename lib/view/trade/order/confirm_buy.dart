import 'package:climate_hackerz/constants/app_colors.dart';
import 'package:climate_hackerz/constants/app_fonts.dart';
import 'package:climate_hackerz/shared/success.dart';
import 'package:climate_hackerz/view/navbar/navbar.dart';
import 'package:flutter/material.dart';

import '../../../component/button.dart';

class ConfirmBuy extends StatefulWidget {
  ConfirmBuy({Key? key}) : super(key: key);

  @override
  State<ConfirmBuy> createState() => _ConfirmBuyState();
}

class _ConfirmBuyState extends State<ConfirmBuy> {
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back_ios_rounded),
                  Text(
                    'Confirm Payment',
                    style: AppFonts.h3.copyWith(fontWeight: FontWeight.w300),
                  ),
                  Icon(Icons.chat_rounded),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pay now',
                        style: AppFonts.body1
                            .copyWith(fontSize: 18, color: Colors.red),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '7236 NGN',
                        style: AppFonts.body1.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'wallet',
                        style: AppFonts.body1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Time left',
                        style: AppFonts.body1
                            .copyWith(color: Pallete.kBlack.withOpacity(0.3)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.2, color: Pallete.kLightText)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '00:54:07',
                              style: AppFonts.body1.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              color: Color.fromARGB(255, 82, 62, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_rounded,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: _getSize.width * 0.8,
                      child: Text(
                        'To avoid loss of funds, do not use cash transactions. We strongly recommend using e-wallet or bank transfers',
                        style: AppFonts.body1
                            .copyWith(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Seller\'s username',
                        style: AppFonts.body1.copyWith(
                            fontSize: 14,
                            color: Pallete.kBlack.withOpacity(0.4)),
                      ),
                      Text(
                        'Chizoba',
                        style: AppFonts.body1
                            .copyWith(fontSize: 14, color: Pallete.kBlack),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Pallete.khint.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Seller\'s real name',
                          style: AppFonts.body1.copyWith(
                              fontSize: 14,
                              color: Pallete.kBlack.withOpacity(0.4)),
                        ),
                        Text(
                          'Chizoba Nweafor',
                          style: AppFonts.body1
                              .copyWith(fontSize: 14, color: Pallete.kBlack),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Send',
                        style: AppFonts.body1.copyWith(
                            fontSize: 14,
                            color: Pallete.kBlack.withOpacity(0.4)),
                      ),
                      Text(
                        '7,234.67 NGN',
                        style: AppFonts.body1
                            .copyWith(fontSize: 14, color: Pallete.kBlack),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Pallete.khint.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recieve',
                          style: AppFonts.body1.copyWith(
                              fontSize: 14,
                              color: Pallete.kBlack.withOpacity(0.4)),
                        ),
                        Text(
                          '20 EKO Token',
                          style: AppFonts.body1
                              .copyWith(fontSize: 14, color: Pallete.kBlack),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rate(1 EKT)',
                        style: AppFonts.body1.copyWith(
                            fontSize: 14,
                            color: Pallete.kBlack.withOpacity(0.4)),
                      ),
                      Text(
                        '7,234.67 NGN',
                        style: AppFonts.body1
                            .copyWith(fontSize: 14, color: Pallete.kBlack),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Pallete.khint.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Placed on',
                          style: AppFonts.body1.copyWith(
                              fontSize: 14,
                              color: Pallete.kBlack.withOpacity(0.4)),
                        ),
                        Text(
                          '28, July 2022, 10:24:24am',
                          style: AppFonts.body1
                              .copyWith(fontSize: 14, color: Pallete.kBlack),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.money_rounded),SizedBox(width: 4,),
                        Text('Payment details')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money_rounded),SizedBox(width: 4,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Bank Transfer',
                              style:
                                  AppFonts.body1.copyWith(color: Colors.white),
                            ),SizedBox(height: 4,),
                            Text(
                              'GTB 0019800586',
                              style: AppFonts.body1,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),SizedBox(height: 16,),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person,color: Pallete.khint,),SizedBox(width: 4,),
                        Text('Seller\'s account details')
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Call 09078099974',
                          style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 80, 79, 79)),
                        ),SizedBox(height: 4,),
                        Text(
                          'Account number 0019800586',
                          style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 80, 79, 79)),
                        ),SizedBox(height: 4,),
                        Text(
                          'Account name Chizoba Nweafor',
                          style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 80, 79, 79)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
SizedBox(height: _getSize.height*0.03,),





              Container(   decoration: BoxDecoration(
                    color: Pallete.kPrimaryColor.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        child: OutlinedButton(
                            child: Text(
                              'Cancel',
                            ),
                            style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                side: BorderSide(
                                    color:  Color.fromARGB(255, 60, 60, 60).withOpacity(0.2),),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3))),
                                primary: Color.fromARGB(255, 41, 41, 41),
                                textStyle: AppFonts.body1),
                            onPressed: () {
                             
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavBar()));
                            }),
                      ),
                      Container(
                     width: MediaQuery.of(context).size.width*0.3,
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: OutlinedButton(
                            child: Text(
                              'I\'ve Paid',
                            ),
                            style: OutlinedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3))),
                                padding: EdgeInsets.symmetric(vertical: 8),
                                primary: Colors.white,
                                backgroundColor: Pallete.kPrimaryColor,
                                shadowColor: Pallete.kLightText,
                                elevation: 0,
                                textStyle: AppFonts.body1),
                            onPressed: () {
                             
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Success(head: 'Success', body: 'You have successfully bought 50 EKO TOKEN', buttonText: 'Use Power')));
                            }),
                      ),
                    ],
                  ),
                ),
              
            )



          ],
        ),
      ),
    ));
  }
}

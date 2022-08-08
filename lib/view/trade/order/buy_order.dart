import 'package:climate_hackerz/component/button.dart';
import 'package:climate_hackerz/constants/app_colors.dart';
import 'package:climate_hackerz/constants/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_route.dart';

class BuyOrder extends StatefulWidget {
  BuyOrder({Key? key}) : super(key: key);

  @override
  State<BuyOrder> createState() => _BuyOrderState();
}

class _BuyOrderState extends State<BuyOrder> {
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackButtonWithHeader(text: 'Buy'),
            SizedBox(
              height: 32,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Pallete.kPrimaryColor.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 31),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seller',
                            style: AppFonts.body1
                                .copyWith(color: Colors.black.withOpacity(0.3)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Chizoba',
                            style: AppFonts.body1.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rate(EKT)',
                            style: AppFonts.body1
                                .copyWith(color: Colors.black.withOpacity(0.3)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('325.0 NGN',
                              style:
                                  AppFonts.body1.copyWith(color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment mode',
                            style: AppFonts.body1
                                .copyWith(color: Colors.black.withOpacity(0.3)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.credit_card_rounded,
                                color: Pallete.kSecondaryColor,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Debit/Credit Card',
                                style: AppFonts.body1
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seller instruction',
                            style: AppFonts.body1
                                .copyWith(color: Colors.black.withOpacity(0.3)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'When you make a payment please send a chat or call me, although i am always online',
                            style: AppFonts.body1.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: _getSize.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buy Amount?',
                    style: AppFonts.body1.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Pallete.kPrimaryColor, width: 0.3)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                      child: Icon(
                                    Icons.electric_bolt,
                                    size: 18,
                                  )),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'EKT',
                                    style: AppFonts.body1.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Pallete.kPrimaryColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: _getSize.width * 0.7,
                                child: TextFormField(
                                  onSaved: (value) {},

                                  textAlign: TextAlign.end,

                                  decoration: InputDecoration(
                                    errorMaxLines: 1,

                                    counterText: '',

                                    hintStyle: AppFonts.body1,

                                    hintText: '0.00',

                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,

                                    focusedBorder: InputBorder.none,

                                    enabledBorder: InputBorder.none,

                                    //labelText: 'widget.error',

                                    labelStyle: AppFonts.body,
                                  ),

                                  //description: 'Min Amount 50.00   Max Amount 500.00',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Min Amount: 100.00   Max Amount: 5000.00',
                        style: AppFonts.body1
                            .copyWith(color: Pallete.kSecondaryColor),
                      )
                    ],
                  ),
                ],
              ),
            ),

 SizedBox(
                               height: _getSize.height * 0.2,),

            Container(   decoration: BoxDecoration(
                    color: Pallete.kPrimaryColor.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('You\'ll pay',
                            style: AppFonts.body1
                                .copyWith(color: Pallete.khint),),
                      Text('7234.00 NGN',
                            style: AppFonts.body1
                                .copyWith(color: Pallete.kBlack,fontSize: 14,fontWeight: FontWeight.w700),)
                    ],),
                    SizedBox(width: 150,
                      child: ButtonWithFuction(text: 'Confirm', onPressed: (){   Navigator.pushNamed(
                context,
                AppRoutes.confirm);}))
                  ],),
                ),
              
            )







          ],
        ),
      ),
    );
  }
}

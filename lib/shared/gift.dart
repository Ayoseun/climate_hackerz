import 'package:climate_hackerz/constants/app_colors.dart';
import 'package:climate_hackerz/constants/app_fonts.dart';
import 'package:climate_hackerz/constants/app_images.dart';
import 'package:flutter/material.dart';

import '../constants/app_route.dart';
import '../utils/get_balance.dart';

class FreeItem extends StatefulWidget {
  FreeItem({Key? key}) : super(key: key);

  @override
  State<FreeItem> createState() => _FreeItemState();
}

class _FreeItemState extends State<FreeItem> {
  @override
  Widget build(BuildContext context) {
        final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF1FFF1),
        body: SafeArea(
          child: Column(
            children: [

 Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
             ),
              child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: _getSize.height*0.08,),
                  Image.asset(AppImages.gift),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Image.asset('assets/images/images/label.png',width: 45,),
                       SizedBox(width: 4,),
                      Text('10 EKO TOKEN',style: AppFonts.bodybold.copyWith(color: Colors.blue,fontSize: 24),),
                     SizedBox(width: 18,),],
                  ),
                  SizedBox(height: 8,),
                   Text('Welcome bonus',style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 205, 155, 5)),)
                ],
              )
            ),
SizedBox(height:  _getSize.height*0.07,),
              GestureDetector(
                onTap: (){ Navigator.pushNamed(
                context,
                AppRoutes.navBar);
                BalanceUtil.balance(context);
                },
                child: Container(
                  height: _getSize.height*0.1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                 color: Pallete.khint.withOpacity(0.1)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                  Icon(Icons.bolt,size: 56,),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text('The Power Of Renewable Energy',style: AppFonts.body1.copyWith(color: Colors.black,fontSize: 16),),
                  SizedBox(height: 8,),   Text('Unlimited clean energy at your fingertip',style: AppFonts.body1,)
                  ],), SizedBox(width: 18,),
                    Container(
                      decoration: BoxDecoration(
                        color: Pallete.khint.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_ios_rounded,size: 18,),
                      )),

                       ],),
                ),
                          ),

              ),
               SizedBox(height: _getSize.height*0.13,), 
              
               Text('10EKT ~20 days under standard usage',style: AppFonts.body1.copyWith(color: Colors.grey,fontSize: 10),),
                 
            ],
          ),
        ));
  }
}

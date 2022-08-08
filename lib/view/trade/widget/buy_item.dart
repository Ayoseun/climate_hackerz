import 'package:climate_hackerz/component/button.dart';
import 'package:climate_hackerz/constants/app_colors.dart';
import 'package:climate_hackerz/constants/app_fonts.dart';
import 'package:climate_hackerz/constants/app_route.dart';

import 'package:flutter/material.dart';

class BuyItem extends StatelessWidget {
   String lead='';
 BuyItem({Key? key,required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _getSize=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Pallete.kGravishColor.withOpacity(0.04),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.network(
                    'https://picsum.photos/200',
                    width: 28,
                  ),
                ),SizedBox(width: 8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'chizoba',
                      style: AppFonts.h1.copyWith(fontSize: 14),
                    ),
                    Text(
                      'completed rate :78%',
                      style:
                          AppFonts.bodylight.copyWith(color: Pallete.kLightText),
                    ),SizedBox(height: 12,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '0.015 EK0 Token =',
                              style: AppFonts.bodylight.copyWith(color: Pallete.kBlack,fontSize: 12),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.bolt_rounded),
                                  Text(
                                    '100 watts',
                                    style: AppFonts.bodylight.copyWith(color: Color(0xFFD2AC47),fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                       SizedBox
                        (width: _getSize.width*0.25,),
                      
                       SizedBox
                        (width: _getSize.width*0.3,
                        height:  _getSize.height*0.06,
                          child: ButtonWithFuction(text: 'Buy', onPressed: (){
                           Navigator.pushNamed(
                context,
                AppRoutes.buyOrder);
              
               
                          }))
                      ],
                    ),SizedBox(height: 12,),
                    Text(
                      'Limit 100 - 750 Watts',
                      style:
                          AppFonts.bodylight.copyWith(color: Pallete.kText,fontSize: 12),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

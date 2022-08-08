import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';
import '../../../constants/resources.dart';

class Wtop extends StatelessWidget {
  String curr = getCurrency();
  Wtop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = 15;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 255, 255, 255)),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  AppImages.two,
                ),
              ),
              // SizedBox(width: 16,),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('balance',
                            textAlign: TextAlign.center,
                            style: AppFonts.body1.copyWith(
                                color: Color(0xFFDCDCDC),
                                fontSize: 12)),
                                SizedBox(height: 4,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('200.56',
                                textAlign: TextAlign.center,
                                style: AppFonts.body1.copyWith(
                                    color: Color(0xFF000000),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                                    SizedBox(height: 16,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Pallete.kSecondaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 8),
                                child: Text('TOP-UP',
                                    style: AppFonts.body1.copyWith(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

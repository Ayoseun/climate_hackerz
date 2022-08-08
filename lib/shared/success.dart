import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../component/button.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_route.dart';


class Success extends StatelessWidget {
  String head = 'Success';
  String body='Your sale offer has been successfully listed on the trafiat marketplace';

  String buttonText='back to dashboard';
  Success({required this.head, required this.body,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(255, 241, 255, 241),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset(AppImages.success),
            Column(
              children: [
                Text(head,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Pallete.kBlack,
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                      body,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Pallete.kLightText,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Button(text: buttonText.toUpperCase(), onPressed: AppRoutes.navBar)
            )
          ],
        ),
      ),
    );
  }
}

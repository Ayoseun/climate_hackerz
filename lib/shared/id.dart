
import 'package:flutter/material.dart';
import '../component/button.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_route.dart';

class IDPopup extends StatelessWidget {
  const IDPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
   backgroundColor: Color(0x1F000000),
    
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal:16.0),
       child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(    color: Colors.white,borderRadius: BorderRadius.circular(5)),
              
                  height: _getSize.height * 0.5,
                  //width: _getSize.width * 0.95,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:24.0,horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Image.asset('assets/images/icons/verify.png',width: 80,color: Pallete.kPrimaryColor,),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              Text(
                                'Identity Verification',
                                style: AppFonts.body1
                                    .copyWith(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 16,),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Text(
                                  'This verification process takes one minute. If you skip this process, you will have a daily transaction limit of 500 instead of 10000 when the verification is completed.',
                                 textAlign: TextAlign.center ,style: AppFonts.body1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: ButtonWithFuction(
                              text: 'proceed to setup'.toUpperCase(),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, AppRoutes.setup, (route) => false);
                              }),
                        ),
                        GestureDetector(
                          onTap: (() => Navigator.of(context).pop()),
                          child: Text(
                            'I\'ll do this later',
                            style:
                                AppFonts.body1.copyWith(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  )),
            ]),
     ),
    );
  }
}

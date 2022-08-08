import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../component/button.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_images.dart';
import '../../constants/app_route.dart';
import '../../constants/resources.dart';

class Power extends StatefulWidget {
  Power({Key? key}) : super(key: key);

  @override
  State<Power> createState() => _PowerState();
}

class _PowerState extends State<Power> {
  String ngn = getCurrency();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const BackButtonWithHeader(
                  text: 'Make Purchase',
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selling Rate',
                              style:
                                  AppFonts.body1.copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              width: _size.width,
                              decoration: BoxDecoration(
                                  color: Color(0xFFEDEDED),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(width: 0.3)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 8),
                                child: Text(
                                  '1kw / 1 EKT',
                                  style: AppFonts.body1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _size.height * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'How much do you want to buy?',
                              style:
                                  AppFonts.body1.copyWith(color: Colors.black),
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
                                          color: Pallete.kPrimaryColor,
                                          width: 0.3)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              'Watt',
                                              style: AppFonts.body1.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Pallete.kPrimaryColor),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: _size.width * 0.7,
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
                        SizedBox(
                          height: _size.height * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction Amount',
                              style:
                                  AppFonts.body1.copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Pallete.kPrimaryColor,
                                      width: 0.3)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            AppImages.eko,
                                            width: 25,
                                            height: 25,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'EKT',
                                          style: AppFonts.body1.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Pallete.kPrimaryColor),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '20.00',
                                      style: AppFonts.body1.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Pallete.khint),

                                      //description: 'Min Amount 50.00   Max Amount 500.00',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _size.height * 0.1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction Summary',
                              style: AppFonts.body2.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Transaction Amount'),
                                Text('20 EKO Token'),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Service Charge'),
                                Text('0.05 EKO Token'),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: _size.width,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 240, 249, 240),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, bottom: 16, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total to Pay',
                                      style: AppFonts.h2.copyWith(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '20.05',
                                          style: AppFonts.bodylight2,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Image.asset(
                                          AppImages.eko,
                                          width: 35,
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ButtonWithFuction(
                            text: 'Confirm Purchase',
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.navBar);
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../model/onboarding.dart';
import '../../shared/local_db.dart';
import '../auth/login/login.dart';
import '../auth/signup/signup.dart';


class OnboardItem extends StatefulWidget {
  const OnboardItem({Key? key}) : super(key: key);

  @override
  _OnboardItemState createState() => _OnboardItemState();
}

class _OnboardItemState extends State<OnboardItem> {
  CarouselController carouselController = CarouselController();
  int _sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sliderItemLength = OboardingItems.loadItems().length;
    final sliderItem = OboardingItems.loadItems();
    final Size = MediaQuery.of(context).size;

    List<Widget> items = [];
    for (var item in sliderItem) {
      items.add(SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Size.height * 0.45,
              width: Size.width * 0.7,
              child: Center(
                child: Image.asset(
                  item.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),SizedBox(height: 16,),
            Text(item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Pallete.kBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ));
    }

    return Scaffold(
      backgroundColor: Pallete.kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Size.height,
            width: Size.width,
            padding: EdgeInsets.symmetric(horizontal: Size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: Size.height * 0.58,
                  width: Size.width,
                  child: CarouselSlider(
                    carouselController: carouselController,
                    items: items,
                    //Slider Container properties
                    options: CarouselOptions(
                      reverse: false,
                      autoPlay: true,
                      height: Size.height * 0.7,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _sliderIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 
                  MediaQuery.of(context).size.height*0.0006,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:112.0),
                      child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 8,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sliderItemLength,
                                itemBuilder: (BuildContext context, int i) {
                                  return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: _sliderIndex == i
                                                  ? Colors.transparent
                                                  : Pallete.kLightText
                                                      .withOpacity(0.5),
                                              width: .5),
                                          borderRadius: BorderRadius.circular(10),
                                          color: _sliderIndex == i
                                              ? Color(0xFFE17AAA)
                                              : Colors.transparent,
                                        ),
                                        width: _sliderIndex == i ? 40 : 4,
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: OutlinedButton(
                              child: Text(
                                'Login'.toUpperCase(),
                              ),
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  side: BorderSide(
                                      color:  Pallete.khint.withOpacity(0.2),),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  primary: Color.fromARGB(255, 78, 78, 78),
                                  textStyle: AppFonts.h2),
                              onPressed: () {
                                IsFirstTime().once(1);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              }),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: OutlinedButton(
                              child: Text(
                                'Register'.toUpperCase(),
                              ),
                              style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  primary: Colors.white,
                                  backgroundColor: Pallete.kPrimaryColor,
                                  shadowColor: Pallete.kLightText,
                                  elevation: 0,
                                  textStyle: AppFonts.h2v),
                              onPressed: () {
                                IsFirstTime().once(1);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              }),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

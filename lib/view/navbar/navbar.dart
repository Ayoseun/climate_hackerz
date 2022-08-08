import 'package:climate_hackerz/constants/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../dashboard/dashboard.dart';
import '../power/power.dart';
import '../profile/profile.dart';
import '../trade/trade.dart';
import '../wallet/wallet.dart';




class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  //set current tab to starting index
  int currentTab = 0;

  //this is a list of all screents passed into a list that takes widget
  final List<Widget> screens = [
    Dashboard(),
    Power(),
    Trade(),
    Wallet(),
    Profile(),
  ];



//declaring pagestorage state
  final PageStorageBucket Bucket = PageStorageBucket();

  Widget currentScreen = Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.kBackgroundColor,
        body:
            //this page storage bucket helps to store each page state in memory
            PageStorage(bucket: Bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Pallete.kPrimaryColor,
          child: Image.asset(
            AppImages.power,
            color: Pallete.whiteColor,
            height: 25,
            width: 25,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.power);
          },
        ),
        //floating action button placed at the center of he navbar
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        //set bottomnavbar
        bottomNavigationBar: BottomAppBar(
            //asign shape to navabr
            shape: CircularNotchedRectangle(),
            //set shape to 10px round
            notchMargin: 2,
            child: Container(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Dashboard();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.home,
                                color: currentTab == 0
                                    ? Pallete.kPrimaryColor
                                    : Colors.grey.withOpacity(0.3),
                                width: 20,
                                height: 20,
                              ),SizedBox(height: 4,),
                              Text('Home',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: currentTab == 0
                                        ? Pallete.kPrimaryColor
                                        : Colors.grey.withOpacity(0.3),
                                  )),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Trade();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.buysell,
                                color: currentTab == 1
                                    ? Pallete.kPrimaryColor
                                    : Colors.grey.withOpacity(0.3),
                                width: 20,
                                height: 20,
                              ),SizedBox(height: 4,),
                              Text('Buy/Sell',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 1
                                          ? Pallete.kPrimaryColor
                                          : Colors.grey.withOpacity(0.3))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0,right: 4),
                      child:
                          Text('Power', style: TextStyle(fontSize: 11,color: Pallete.khint)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Wallet();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.wallet,
                                color: currentTab == 2
                                    ? Pallete.kPrimaryColor
                                    : Colors.grey.withOpacity(0.3),
                                width: 20,
                                height: 20,
                              ),SizedBox(height: 4,),
                              Text('Wallet',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 2
                                          ? Pallete.kPrimaryColor
                                          : Colors.grey.withOpacity(0.3))),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Profile();
                              currentTab = 4;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.asset(
                                AppImages.profile,
                                color: currentTab == 4
                                    ? Pallete.kPrimaryColor
                                    : Colors.grey.withOpacity(0.3),
                                width: 20,
                                height: 20,
                              ),SizedBox(height: 4,),
                              Text('Profile',
                                  style: TextStyle(
                                    fontSize: 11,
                                      color: currentTab == 4
                                          ? Pallete.kPrimaryColor
                                          : Colors.grey.withOpacity(0.3))),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
            )));
  }
}

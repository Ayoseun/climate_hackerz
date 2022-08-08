import 'package:climate_hackerz/view/wallet/widget/wallet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_images.dart';
import '../../constants/app_route.dart';
import '../../constants/resources.dart';
import '../dashboard/dashboard.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

    List<Map> idType = [
    {
      'id': 0,
      'type': 'assets/images/icons/ac.png',
      "data": "Light Bulb",
      "count": "7 devices"
    },
    {
      'id': 1,
      'type': 'assets/images/icons/bulb.png',
      "data": "Air Conditioner",
      "count": "2 devices"
    },
    {
      'id': 2,
      'type': 'assets/images/icons/tv.png',
      "data": "TV",
      "count": "3 devices"
    },
    {
      'id': 3,
      'type': 'assets/images/icons/bulb.png',
      "data": "Light Bulb",
      "count": "3 devices"
    },
    {
      'id': 4,
      'type': 'assets/images/icons/ac.png',
      "data": "Air Conditioner",
      "count": "3 devices"
    },
    {
      'id': 5,
      'type': 'assets/images/icons/tv.png',
      "data": "TV",
      "count": "1 devices"
    },
  ];

  @override
  Widget build(BuildContext context) {
      var l = idType.length;
          final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                         decoration:  BoxDecoration(
                          border: Border.all(width: 0.5,color: Pallete.khint.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Pallete.khint.withOpacity(0.1),
                                blurRadius:
                                    7.0, // has the effect of softening the shadow
                                spreadRadius:
                                    0.5, // has the effect of extending the shadow
                                offset: const Offset(
                                  0.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.search,color: Pallete.kLightText,size: 24,),
                              Text('Search',style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 202, 205, 205)),)
                            ],
                          ),
                        )
                      ),



                      Container(
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Pallete.khint.withOpacity(0.1),
                                blurRadius:
                                    7.0, // has the effect of softening the shadow
                                spreadRadius:
                                    0.5, // has the effect of extending the shadow
                                offset: const Offset(
                                  0.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              AppImages.bell,
                              width: 20,
                            ),
                          )),
                    ],
                  ),
                ),
                Wtop(),

                  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                child: Text(
                  'My Devices',
                  style: AppFonts.body1.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: _getSize.width,
                height: _getSize.height * 0.38,
                child: GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 2),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        childCount: l,
                        (context, l) => Tile(
                              txt2: idType[l]['count']!,
                              img: idType[l]['type']!,
                              txt: idType[l]['data']!,
                            ))),
              ),
            ],
          )
     
              ],
            ),
          ),
        ),
      ),
    );
  }
}

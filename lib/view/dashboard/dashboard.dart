import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:climate_hackerz/constants/app_colors.dart';
import 'package:climate_hackerz/constants/app_fonts.dart';
import 'package:climate_hackerz/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../model/dashboard_item.dart';
import '../../model/onboarding.dart';
import '../../shared/local_db.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  CarouselController carouselController = CarouselController();
  int _sliderIndex = 0;
  String name = '';

  check() async {
    var mName = await UserPrefrences.showName();
    setState(() {
      var newName =
          ' ${mName[0].toUpperCase()}${mName.substring(1).toLowerCase()}';
      name = newName;
    });
  }

  @override
  void initState() {
    check();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _sliderItemLength = DashItems.loadItems().length;
    final _sliderItem = DashItems.loadItems();
    final Size = MediaQuery.of(context).size;

    List<Widget> items = [];
    for (var item in _sliderItem) {
      items.add(SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Pallete.whiteColor,
            border:
                Border.all(width: 0.5, color: Pallete.khint.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Pallete.khint.withOpacity(0.3),
                blurRadius: 11.0, // has the effect of softening the shadow
                spreadRadius: 1.5, // has the effect of extending the shadow
                offset: const Offset(
                  0.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(
                  item.image,
                  
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(item.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Pallete.kBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ));
    }

    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.bell,
                    width: 24,
                    color: Pallete.kBlack,
                  ),
                  Text(
                    'Hello!, $name',
                    style: AppFonts.bodyblack,
                  ),
                  ClipOval(
                    child: Image.network(
                      'https://picsum.photos/200',
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _getSize.height * 0.04,
            ),
            CircularPercentIndicator(
              radius: 90.0,
              lineWidth: 8.0,
              animation: true,
              percent: 0.65,
              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '65%',
                    style: AppFonts.body1.copyWith(
                        color: Pallete.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Stack(
                    children: [
                      Icon(Icons.bolt_rounded, color: Color(0xFFD2AC47)),
                      Icon(Icons.bolt_rounded,
                          size: 65, color: Color(0xFFD2AC47)),
                    ],
                  )
                ],
              ),
              footer: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '5.05',
                      style: AppFonts.body1
                          .copyWith(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(width: 2),
                    Text(
                      'Kwh',
                      style: AppFonts.body1.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Pallete.kPrimaryColor,
            ),
            SizedBox(
              height: _getSize.height * 0.03,
            ),
            Container(
              height: 300,
              width: Size.width*0.95,
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Learn about green clean energy',
                    style: AppFonts.body1
                        .copyWith(fontSize: 14, color: Pallete.kSecondaryColor),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 240,
                    width: Size.width,
                    child: CarouselSlider(
                      carouselController: carouselController,
                      items: items,
                      //Slider Container properties
                      options: CarouselOptions(
                        reverse: false,
                        autoPlay: true,
                        height: 260,
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
                    height: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 112.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 8,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _sliderItemLength,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: _sliderIndex == i
                                                ? Color.fromARGB(255, 0, 0, 0)
                                                : Colors.transparent,
                                          ),
                                          width: _sliderIndex == i ? 40 : 4,
                                        ));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
               
               
               
               
               
               Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Smart meter monitor',style: AppFonts.body1.copyWith(color: Pallete.kBlack),),
              ),
              
             Container(
              height: _getSize.height*0.118,
              width: _getSize.width,
               decoration: BoxDecoration(
                  color: Color.fromARGB(125, 241, 255, 241),
                 
                  borderRadius: BorderRadius.circular(10),
                 
                ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                
                
                  SizedBox(height: 16,),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Row(
                        children: [
                          Icon(Icons.speed_outlined,color: Pallete.kPrimaryColor,size: 18,),
                          SizedBox(width: 4,),
                          Text('Meter number: ',style: AppFonts.body1,),
                           Text('yt5t43wqi98y',style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 0, 0, 0)),),
                        ],
                      ),
                       Text('connected',style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 1, 84, 4)),),
                     ],
                   ),  SizedBox(height: 8,),
                   
                    Row(
                        children: [
                          Icon(Icons.thermostat,color: Color.fromARGB(255, 205, 205, 5),size: 18,),
                          SizedBox(width: 4,),
                          Text('Meter health: ',style: AppFonts.body1,),
                           Text('    Excellent',style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 0, 0, 0)),),
                        ],
                      ),
                ],),
              ),
             ),
           ],
               )
               
               
               
               
               
               
               
               
               
               
               
               
          ]),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  Tile({
    Key? key,
    this.bottomSpace,
    this.txt,
    this.txt2,
    this.img,
  }) : super(key: key);

  final double? bottomSpace;
  final String? txt;
  final String? txt2;
  final String? img;

  @override
  Widget build(BuildContext context) {
    bool status1 = false;
    final child = Container(
      decoration: BoxDecoration(
          color: Pallete.kGravishColor.withOpacity(0.04),
          borderRadius: BorderRadius.circular(10)),
      height: 10,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img!,
            width: 24,
            color: Color.fromARGB(255, 9, 129, 198),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            txt!,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            txt2!,
            textAlign: TextAlign.center,
            style: AppFonts.body1,
          ),
        ],
      )),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}

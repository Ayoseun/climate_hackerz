import 'package:flutter/material.dart';

import '../widget/buy_item.dart';

class Sell extends StatefulWidget {
  Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
 @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return BuyItem(lead: 'Sell',);
      },
    );
  }
}

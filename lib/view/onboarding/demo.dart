import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Center(child: Column(children: [Image.asset('assets/images/images/mflock.png',width: 150,)],)),);
  }
}





import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
class BackButtonWithHeader extends StatelessWidget {
  final String text;

  const BackButtonWithHeader({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back)),
      Padding(
        padding: EdgeInsets.only(right: 32.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style:
                AppFonts.body1.copyWith(fontSize: 16, color: Pallete.kBlack)),
      ),
      Text('', textAlign: TextAlign.center, style: AppFonts.h1)
    ]);
  }
}

class ButtonWithFuction extends StatelessWidget {
  const ButtonWithFuction({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  //this calls the onpressed widget
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
            child: Text(
              text,
            ),
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                primary: Colors.white,
                backgroundColor: Pallete.kPrimaryColor,
                shadowColor: Color.fromARGB(126, 91, 125, 87),
                elevation: 5,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
            onPressed: onPressed));
  }
}

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  //this calls the onpressed widget
  final String onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
            child: Text(text),
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                primary: Colors.white,
                backgroundColor: Pallete.kPrimaryColor,
                shadowColor: Pallete.kLightText,
                elevation: 0,
                textStyle: AppFonts.h2v.copyWith(fontSize: 14)),
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(onPressed, (route) => false)));
  }
}

class Button2 extends StatelessWidget {
  Button2({
    required this.text,
    required this.onPressed,
  });

  final String text;
  //this calls the onpressed widget
  final Widget onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
            child: Text(
              text.toUpperCase(),
              style: AppFonts.body1.copyWith(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
            ),
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1))),
              padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              primary: Colors.white,
              backgroundColor: Pallete.kPrimaryColor,
              shadowColor: Pallete.kLightText,
              elevation: 0,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => onPressed));
            }));
  }
}

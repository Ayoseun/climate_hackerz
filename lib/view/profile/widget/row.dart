import 'package:flutter/material.dart';


import '../../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class ResuseableRow extends StatelessWidget {
const ResuseableRow({required this.text, required this.img,required this.onPressed});
  final String text;
  final String img;
  final String onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  Navigator.of(context).pushNamed (onPressed),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    img,
                    width: 24,
                    color: Pallete.kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(text,
                    textAlign: TextAlign.center,
                    style: AppFonts.body1.copyWith(color: Color.fromARGB(255, 29, 29, 29),fontSize: 14)),
              ],
            ),
            IconButton(
                onPressed: () => onPressed, icon: Icon(Icons.arrow_forward_ios,size: 14,)),
          ],
        ),
      ),
    );
  }
}

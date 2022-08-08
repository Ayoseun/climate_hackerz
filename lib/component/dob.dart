import 'package:flutter/material.dart';


import '../constants/app_fonts.dart';
import 'input.dart';

class DOB extends StatelessWidget {
  final Function(String?)? day;
  String error = '';
  final Function(String?)? month;
  final Function(String?)? year;

  final Function(String?)? onchangedYear;

  final Function(String?)? onChangedMonth;

  final Function(String?)? onChangedDay;

  DOB(
      {Key? key,
      required this.day,
      required this.error,
      required this.month,
      required this.year,
      this.onchangedYear,
      this.onChangedMonth,
      this.onChangedDay, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Date of Birth',
            textAlign: TextAlign.center,
            style: AppFonts.body1.copyWith(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 4,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: BioField(
                onSaved: day,
                hint: 'dd',

                onChanged: onChangedDay,
                type: 'number',
                // (value) {
                //   //pass value to the email object
                //   _dob['day'] = value;
                // },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: BioField(
                //text: '',

                type: 'number',
                onSaved: month,
                onChanged: onChangedMonth,
                hint: 'mm',
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: BioField(
                onSaved: year,
                onChanged: onchangedYear,
                hint: 'yyy',
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          error,
          style: AppFonts.body1.copyWith(color: Colors.red),
        ),
      ] //     Text(error,
          //       textAlign: TextAlign.center,
          //       style: TextStyle(fontWeight: FontWeight.w500)),
          // ],
          ),
    );
  }
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from < this && this < to;
  }
}

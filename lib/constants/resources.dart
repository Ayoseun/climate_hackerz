
import 'package:intl/intl.dart';
import 'dart:io';

const String profile = 'https://unsplash.com/photos/RBerxXPnZPE';
//get nigerian currency symbol
String getCurrency() {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  return format.currencySymbol;
}
List<Map> gender = [
  {'id': 0, 'gender': 'Female'},
  {'id': 1, 'gender': 'Male'},
  {'id': 2, 'gender': 'Others'},
  {'id': 3, 'gender': 'Prefer not to say'}
];

List<Map> hearAboutUs = [
  {'id': 0, 'media': 'Twitter'},
  {'id': 1, 'media': 'Facebook'},
  {'id': 2, 'media': 'WhatsApp'},
  {'id': 3, 'media': 'Referral'}
];
List<Map> idType = [
  {'id': 0, 'type': 'Driver\'s license'},
  {'id': 1, 'type': 'International Passport'},
  {'id': 2, 'type': 'Voter\'s Card(PVC)'},
  {'id': 3, 'type': 'National ID Card'}
];
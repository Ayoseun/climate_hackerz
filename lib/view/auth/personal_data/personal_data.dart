import 'package:climate_hackerz/constants/app_colors.dart';
import 'package:climate_hackerz/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../component/button.dart';
import '../../../component/dob.dart';
import '../../../component/input.dart';
import '../../../constants/app_route.dart';
import '../../../constants/resources.dart';
import '../../../utils/KYC_util.dart';

class PersonalData extends StatefulWidget {
  PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  bool isShown = false;

  var setReferral;

  dynamic valid = '';

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  final _detailsFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void validatedyear(value) {
    var now = DateTime.now();
    var formatter = DateFormat('yyy');
    //get current date
    String formattedDate = formatter.format(now);
    dynamic days = value.trim();
    //set age limit
    int limit = int.parse(formattedDate);

    //convert user input to integer
    final i = int.parse(days);
    //set current date to int
    final thisYear = int.parse(formattedDate);
    if (i < limit - 100) {
      valid = 'Invalid age range';
    } else {
      if (i.isBetween(limit - 100, thisYear - 18)) {
        valid = '';
      }
    }
    if (i > thisYear - 18) {
      valid = 'You must be 18 and above';
    } else {
      if (i.isBetween(limit - 100, thisYear - 18)) {
        valid = '';
      }
    }
  }

  void validatedmonth(value) {
    dynamic days = value.trim();

    final i = int.parse(days);
    if (days.isEmpty) {
      // Password has number
      valid = 'fields cannot be empty';
    }

    if (i.isBetween(0, 13)) {
      valid = '';
    } else {
      valid = 'Month must be between 1-12(Jan-Dec)';
    }
  }

  void validated(value) {
    dynamic days = value.trim();

    final i = int.parse(days);
    if (days.isEmpty) {
      // Password has number
      valid = 'fields cannot be empty';
    }

    if (i.isBetween(0, 32)) {
      valid = '';
    } else {
      valid = 'Invalid date, must be between 1-31';
    }
  }

  final Map<String, dynamic> _personalDetails = {
    'firstName': '',
    'lastName': '',
    'gender': '',
    'phone': '',
    'privacyAccepted': '',
    'termsAccepted': '',
    'city': '',
    'state': '',
    'username': '',
  
  };

  bool policyAgreed = false;
  bool termsAgreed = false;
  String? _isGender;
  String? phone;
  String? _ishearAboutUs;
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [ SizedBox(height: 4,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0,vertical:8),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Step 1 of 3',
                  style: AppFonts.body1,
              ),
              SizedBox(height: 4,),
              Text(
                  'Personal Details',
                  style: AppFonts.body1.copyWith(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ],
                  ),
                ),   SizedBox(height: 8,),
                Container(
            width: _getSize.width,
            height: 0.5,
            color: Pallete.kSecondaryColor,
                ),   
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                          key: _detailsFormKey,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                            //custom textfield for email and password
                            Field(
                    text: 'First Name',
                    hint: 'Enter your first name',
                    onSaved: (value) {
                      //pass value to the email object
                      _personalDetails['firstName'] = value;
                    },
                    // validator: Validators.nameValidator,
                            ),
                            const SizedBox(
                    height: 16,
                            ),
                            //custom textfield for email and password
                            Field(
                    hint: 'Enter your last name',
                    text: 'Last Name',
                    onSaved: (value) {
                      //pass value to the email object
                      _personalDetails['lastName'] = value;
                    },
                    // validator: Validators.nameValidator,
                            ),const SizedBox(
                    height: 16,
                            ),
                            //custom textfield for email and password
                            Field(
                    hint: 'Enter your username',
                    text: 'username',
                    onSaved: (value) {
                      //pass value to the email object
                      _personalDetails['username'] = value;
                    },
                    // validator: Validators.nameValidator,
                            ),
                            const SizedBox(
                    height: 24,
                            ),
                            //custom textfield for email and password
                            Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select gender',
                          textAlign: TextAlign.center,
                          style: AppFonts.body1
                              .copyWith(color: Colors.black, fontSize: 14)),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Pallete.shadowcolor),
                          height: 70,
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              hint: const Text(
                                'Gender',
                                style: TextStyle(fontSize: 14),
                              ),
                              value: _isGender,
                              onChanged: (newValue) {
                                setState(() {
                                  _isGender = newValue.toString();
                                });
                              },
                              items: gender
                                  .map(
                                    (genderItem) => DropdownMenuItem(
                                      onTap: () {
                                        _personalDetails['gender'] =
                                            genderItem['gender'];
                                      },
                                      child: Text(genderItem['gender'],
                                          style: AppFonts.body1.copyWith(
                                              color: Colors.black, fontSize: 14)),
                                      value: genderItem['id'].toString(),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ))),
                    ],
                            ),
                      
                            const SizedBox(
                    height: 32,
                            ),
                            SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InternationalPhoneNumberInput(
                            onSubmit: () =>
                                _personalDetails['phone'] = number.phoneNumber,
                            onFieldSubmitted: (value) =>
                                _personalDetails['phone'] = number.phoneNumber,
                            onInputChanged: (PhoneNumber number) {},
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.always,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            initialValue: number,
                            textFieldController: controller,
                            formatInput: false,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                              _personalDetails['phone'] = number.phoneNumber;
                            },
                          ),
                        ]),
                            ),
                        
                            const SizedBox(
                    height: 16,
                            ),
                        
                            //custom textfield for email and password
                            Field(
                    hint: 'Enter your state',
                    text: 'state',
                    onSaved: (value) {
                      //pass value to the email object
                      _personalDetails['state'] = value;
                    },
                    // validator: Validators.nameValidator,
                            ),const SizedBox(
                    height: 16,
                            ),
                            //custom textfield for email and password
                            Field(
                    hint: 'Enter your city',
                    text: 'city',
                    onSaved: (value) {
                      //pass value to the email object
                      _personalDetails['city'] = value;
                    },
                    // validator: Validators.nameValidator,
                            ),
                            ]),
                    ),
                  ),
                ),
                Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    side: const BorderSide(width: 1, style: BorderStyle.solid),
                    activeColor: Pallete.kSecondaryColor,
                    value: termsAgreed,
                    onChanged: (value) {
                      setState(() {
                        termsAgreed = value!;
                        _personalDetails['termsAccepted'] = termsAgreed;
                      });
                    },
                  ),
                  CustomTextSpan(
                      Pallete.kBlack,
                      AppRoutes.termsOfUse,
                      "I agree to the ",
                      'Terms and Conditions',
                      ' of use of this \napplication'),
                ],
              ), //custome spannable widget that accepts navigation route and string
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    side: const BorderSide(width: 1, style: BorderStyle.solid),
                    activeColor: Pallete.kSecondaryColor,
                    value: policyAgreed,
                    onChanged: (value) {
                      setState(() {
                        policyAgreed = value!;
                        _personalDetails['privacyAccepted'] = policyAgreed;
                      });
                    },
                  ),
                  CustomTextSpan(
                      Pallete.kBlack,
                      AppRoutes.policy,
                      "I consent to the ",
                      'Privacy Policy',
                      ' of use of this\n application'),
                ],
              ),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 16),
                child: ButtonWithFuction(
                    text: ' proceed'.toUpperCase(),
                    onPressed: () {
                      //_detailsFormKey.currentState!.save();
                    
                      KYCUtil.kyc(_detailsFormKey, context, _personalDetails);
                      print(_personalDetails);
                     }),
              )
            ],
                ),
              ]),
          ),
        ));
  }
}

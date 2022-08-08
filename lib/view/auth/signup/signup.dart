import 'package:flutter/material.dart';

import '../../../component/button.dart';
import '../../../component/input.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_route.dart';
import '../../../utils/register.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   //hide password state
  bool _obsecure = false;

//form key
  final _signupFormKey = GlobalKey<FormState>();

  //object to inject inputs
  final Map<String, dynamic> _signupData = {
    'email': '',
    'password': '',
    'confirmPassword': ''
  };

  //value check
  bool value = false;
  String confirmPassword = '';
  //password visibility check
  bool passwordVisible = false;
  
  bool obsecure=false;
  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //willpop controls the device back buttton
    return WillPopScope(
      //on willpop is set to true so that the back button shuts down the app
      onWillPop: () async => true,
      //parent widget
      child: Scaffold(
          backgroundColor: Pallete.kBackgroundColor,
          //safearea widget helps keep the screen from overlapping statusbar
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                //this is to set the widget tree to fit the screen height and width
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  //this padding widget helps set  the width margin for the layout
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //create account text
                          Text("Create Account",
                              textAlign: TextAlign.center, style: AppFonts.h1),
                          //this sizebox spaces the texts
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                              "Create a free account to begin livestock experience with MFLock.",
                              textAlign: TextAlign.start,
                              style: AppFonts.body),
                        ],
                      ),
                      Form(
                        key: _signupFormKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              //custom textfield for email and password
                              Field(
                                text: 'Email',
                                hint: 'Enter Email Address',
                                onSaved: (String? text) =>
                                    _signupData['email'] = text,
                               // validator: Validators.emailValidator,
                              ),
                            const  SizedBox(
                                height: 16,
                              ),
                              Field(
                                obsecure: obsecure,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obsecure = !obsecure;
                                    });
                                  },
                                  child: Image.asset(
                                    obsecure
                                        ? AppImages.eyesOn
                                        : AppImages.eyesOff,
                                    scale: 4,
                                  ),
                                ),
                                text: 'Password',
                                hint: 'Enter password',
                                
                                onSaved: (value) {
                                  //pass value to the email object
                                  _signupData['password'] = value;
                                },
                               // error: valid,
                                onChanged: (value) {
                                  confirmPassword = value!;
                                  setState(() {
                                    //passwordValidator(value);
                                  });
                                },
                              ), //this sizebox spaces the texts
                              const SizedBox(
                                height: 16,
                              ),
                              Field(
                                obsecure: obsecure,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obsecure = !obsecure;
                                    });
                                  },
                                  child: Image.asset(
                                    obsecure
                                        ? AppImages.eyesOn
                                        : AppImages.eyesOff,
                                    scale: 4,
                                  ),
                                ),
                                text: 'Confirm Password',
                                hint: 'Confirm password',
                                onSaved: (value) {
                                  _signupData['confirmPassword'] = value;
                                },
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Confirm password cannot be empty';
                                  }
                                  if (value != confirmPassword) {
                                    return 'Password does not match';
                                  }
                                  return null;
                                },
                              ),
                            ]),
                      ),
                      Column(
                        children: [
                          //signup button
                          ButtonWithFuction(
                              text: 'create account'.toUpperCase(),
                              onPressed: () {
                               // Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.navBar, (route) => false);
                                RegisterUtil.register(
                                   _signupFormKey, context, _signupData);
                              }),

                          const SizedBox(
                            height: 8,
                          ),
                          //custome spannable widget that accepts navigation route and string
                          CustomTextSpan(
                              Pallete.kPrimaryColor,
                              AppRoutes.login,
                              "Already have an account? ",
                              'Login'.toUpperCase(),
                              '')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

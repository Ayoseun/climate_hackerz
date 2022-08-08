import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../component/button.dart';
import '../../../component/input.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_route.dart';
import '../../../utils/login.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "Tolulope";

  final _loginFormKey = GlobalKey<FormState>();

  //placeholder for the user data
  final Map<String, dynamic> _loginData = {'email': '', 'password': ''};
  
  bool obsecure=false;



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
                          Text("Welcome",
                              textAlign: TextAlign.center, style: AppFonts.h1),
                          //this sizebox spaces the texts
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text("Login to your MFlock account.",
                                textAlign: TextAlign.start,
                                style: AppFonts.body),
                          ),
                        ],
                      ),
                      Form(
                        key: _loginFormKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              //custom textfield for email and password
                              Field(
                               // validator: Validators.emailValidator,
                                text: 'Email Address',
                                hint: 'Enter Email Address',
                                onSaved: (String? text) =>
                                    _loginData['email'] = text,
                                //validator: Validators.emailValidator,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Field(
                               
                                obsecure: obsecure,
                                text: 'Password',
                                hint: 'Enter password',
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
                                // error: valid,
                                onChanged: (value) {
                                  setState(() {
                                   // passwordValidator(value);
                                  });
                                },

                                onSaved: (value) {
                                  //pass value to the email object
                                  _loginData['password'] = value;
                                },
                                //validator: Validators.passwordValidator,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppRoutes.forgotPassword),
                                  child: Text(
                                    'Forgot Password?',
                                    style: AppFonts.body1.copyWith(
                                        color: Pallete.kSecondaryColor),
                                  ))
                            ]),
                      ),
                      Column(
                        children: [
                          //login button
                          ButtonWithFuction(
                              text: 'Login'.toUpperCase(),
                              onPressed: () {
                             // Navigator.of(context).pushNamed(AppRoutes.navBar);
                                 LoginUtil.login(
                                     _loginFormKey, context, _loginData);
                              }),

                          const SizedBox(
                            height: 8,
                          ),
                          //custome spannable widget that accepts navigation route and string
                          CustomTextSpan(
                              Pallete.kPrimaryColor,
                              AppRoutes.signupscreen,
                              "Don't have an account? ",
                              'Register',
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

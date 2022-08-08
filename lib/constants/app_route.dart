import 'package:climate_hackerz/view/auth/personal_data/ID/id.dart';
import 'package:climate_hackerz/view/auth/personal_data/createWallet/create_wallet.dart';
import 'package:climate_hackerz/view/auth/personal_data/personal_data.dart';
import 'package:climate_hackerz/view/power/power.dart';
import 'package:climate_hackerz/view/trade/order/buy_order.dart';
import 'package:climate_hackerz/view/trade/order/confirm_buy.dart';
import 'package:flutter/cupertino.dart';

import '../view/auth/login/login.dart';
import '../view/auth/signup/signup.dart';
import '../view/navbar/navbar.dart';


class AppRoutes {
  // ONBOARDING
  static const onboarding = '/onboarding';

  // navbar
  static const navBar = '/navbar';

  // AUTH

  //login
  static const login = '/login';
  static const newPassword = '/newPassword';
  static const passwordResetOTP = '/passwordResetOTP';
  //OTP
  static const otpscreen = '/otpscreen';
  //SIGNUP
  static const signupscreen = '/signup';
  static const forgotPassword = '/forgotPassword';
  //changepasswordotp
  static const changePasswordOTP = '/changePasswordOTP';
  static const manageNotification = '/manageNotification';
//verifyotp
  static const verifyOTP = '/verifyOTP';

  //USER

  //PERSONALDETAILS
  static const personaldetails = '/personaldetails';
  //POLICY
  static const policy = '/policy';
  //CHANGEPASSWORD
  static const changePassword = '/changePassword';

  //WALLET
  static const purchase = '/purchase';
  //OFFERDETAILS
  static const offerdetails = '/offerdetails';
  //WITHDRAW
  static const withdraw = '/withdraw';
  //FUND
  static const fundwallet = '/fundwallet';
  //CHECKOUT
  static const checkOut = '/checkout';
  static const social = '/social';
  static const faq = '/faq';
  static const review = '/review';
  static const about = '/about';
  static const termsOfUse = '/termsOfUse';
  static const termsOfPurchase = '/termsOfPurchase';
  static const privacy = '/privacy';
  static const chat = '/chat';
    static const setup = '/setup';
     static const id = '/id';
     static const createWallet = '/createWallet';
  static const trackComplaint = '/trackCompliant';
  static const reopenComplaint = '/reopenCompliant';
  static const makeComplaint = '/makeCompliant';
  static const complaints = '/Compliants';
  static const helpLines = '/helpLines';
  static const writeReview = '/writeReview';
  static const power = '/power';
  static const addbeneficiaries = '/addbeneficiaries';
//PROFILE
  static const confirm = '/confirm';
  static const buyOrder = '/buyOrder';
  static const refund = '/refund';
  static const editProfile = '/editProfile';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      // ONBOARDING
    
AppRoutes.id: (context) => IdentityVerification(),
      //AUTH
       AppRoutes.confirm: (context) => ConfirmBuy(),
   
      AppRoutes.signupscreen: (context) => SignUp(),
       AppRoutes.buyOrder: (context) => BuyOrder(),
      //signup route
      AppRoutes.login: (context) => LoginScreen(),
      //otp route
   AppRoutes.createWallet: (context) => DisplayWallet(),
      //navbar route
      AppRoutes.navBar: (context) => NavBar(),
AppRoutes.power: (context) => Power(),

   
    };
  }
}

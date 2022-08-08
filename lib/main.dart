import 'package:climate_hackerz/shared/gift.dart';
import 'package:climate_hackerz/shared/local_db.dart';
import 'package:climate_hackerz/view/auth/login/login.dart';
import 'package:climate_hackerz/view/auth/personal_data/createWallet/create_wallet.dart';
import 'package:climate_hackerz/view/auth/signup/signup.dart';
import 'package:climate_hackerz/view/navbar/navbar.dart';
import 'package:climate_hackerz/view/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants/app_provider.dart';
import 'constants/app_route.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<int> alreadyAUser = IsFirstTime().getOnce();
    return MultiProvider(
        providers: AppProviders.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context)
                  .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
            ),
          ),
          routes: AppRoutes.routes(),
          home: FutureBuilder(
            builder: (ctx, snapshot) {
              // Checking if future is resolved or not
              if (snapshot.connectionState == ConnectionState.done) {
                // check if snapshot has data and then convert data to int
                if (snapshot.hasData) {
                  final data = snapshot.data as int;

                  switch (data) {
                    case 0:
                      return OnboardItem();

                    case 1:
                      return LoginScreen();

                    case 2:
                      return NavBar();
                  }

                  // if we got our data
                }
              }
              // Displaying empty to indicate waiting state
              return Container(
                color: Colors.white,
              );
            },
            future: alreadyAUser,
          ),
        ));
  }
}

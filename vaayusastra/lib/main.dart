import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'dashboard_page.dart';
import 'level1.dart';
import 'level2.dart';
import 'level3.dart';
import 'level4.dart';
import 'paymentOption_page.dart';
import 'cart_page.dart';
import 'onboarding_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FutureBuilder<bool>(
        future: _checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return snapshot.data == true ? OnboardingNavigator() : SplashScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/level1': (context) => Level1DetailPage(),
        '/level2': (context) => Level2DetailPage(),
        '/level3': (context) => Level3DetailPage(),
        '/level4': (context) => Level4DetailPage(),
        '/payment': (context) => PaymentOptionsPage(),
        '/upi': (context) => UpiPaymentPage(),
        '/credit_card': (context) => CreditCardPaymentPage(),
        '/debit_card': (context) => DebitCardPaymentPage(),
        '/paypal': (context) => PayPalPaymentPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }

  Future<bool> _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstSeen = prefs.getBool('firstSeen') ?? true;
    return firstSeen;
  }
}

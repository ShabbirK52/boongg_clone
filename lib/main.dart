import 'package:boongg_clone/screens/home_screen.dart';
import 'package:boongg_clone/screens/location_screen.dart';
import 'package:boongg_clone/screens/login_screen.dart';
import 'package:boongg_clone/screens/my_bookings.dart';
import 'package:boongg_clone/screens/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LocationScreen.id,
      routes: {
        LocationScreen.id: (context) => LocationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MyBookings.id: (context) => MyBookings(),
        LoginScreen.id: (context) => LoginScreen(),
        OTPScreen.id: (context) => OTPScreen(),
      },
    );
  }
}

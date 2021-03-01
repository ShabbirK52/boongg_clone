import 'package:boongg_clone/screens/home_screen.dart';
import 'package:boongg_clone/screens/location_screen.dart';
import 'package:boongg_clone/screens/login_screen.dart';
import 'package:boongg_clone/screens/my_bookings.dart';
import 'package:boongg_clone/screens/enter_phone.dart';
import 'package:boongg_clone/screens/opt_check.dart';
import 'package:boongg_clone/services/location.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/driving_license.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences pref;
  var isUserLoggedin;
  var isLocationAvailable;
  UserLocation userLocation;

  getSharedPreferences() async {
    userLocation = UserLocation();
    pref = await SharedPreferences.getInstance();
    setState(() {
      userLocation.latitude == null
          ? pref.setBool('isLocationAvailable', false)
          : pref.setBool('isLocationAvailable', true);
      isUserLoggedin = pref.getBool('isUserVerified') ?? false;
      isLocationAvailable = pref.getBool('isLocationAvailable') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isLocationAvailable == false || null
          ? LocationScreen.id
          : isUserLoggedin == false || null
              ? LoginScreen.id
              : HomeScreen.id,
      routes: {
        LocationScreen.id: (context) => LocationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MyBookings.id: (context) => MyBookings(),
        LoginScreen.id: (context) => LoginScreen(),
        EnterPhone.id: (context) => EnterPhone(),
        VerifyOTP.id: (context) => VerifyOTP(),
        DrivingLicense.id: (context) => DrivingLicense(),
      },
    );
  }
}

import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  static String id = "my_bookings";
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookings"),
      ),
      body: Container(),
    );
  }
}

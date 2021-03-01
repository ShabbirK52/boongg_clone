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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "My Bookings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(),
    );
  }
}

import 'package:boongg_clone/screens/login_screen.dart';
import 'package:boongg_clone/services/location.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  static String id = 'location_screen';
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  UserLocation location = new UserLocation();

  void getLocationData() async {
    await location.getCurrentLocation();
    Navigator.pushNamed(context, LoginScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage("images/location.png"),
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Turn on location"),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.green,
              padding: EdgeInsets.all(20),
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () async {
                getLocationData();
              },
              child: Text(
                "Enable GPS",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

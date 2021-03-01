import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:boongg_clone/components/drawer_menu.dart';
import 'package:boongg_clone/services/vehicile_details.dart';
import 'package:geocoding/geocoding.dart';
import 'package:boongg_clone/services/location.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VehicleList vehicles = VehicleList();
  var json;
  UserLocation loc;
  MapController controller;

  Future getUserLocation() async {
    controller = MapController();
    loc = UserLocation();
    await loc.getCurrentLocation();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(loc.latitude, loc.longitude);
    json = jsonEncode(placemarks.map((e) => e.toJson()).toList());
    json = jsonDecode(json);
    setState(() {
      controller.move(LatLng(loc.latitude, loc.longitude), 15);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: json == null
            ? Text(
                "Clone",
                style: TextStyle(color: Colors.black),
              )
            : Wrap(children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.deepPurple,
                ),
                Text(
                  "${json[0]["subLocality"]}",
                  style: TextStyle(color: Colors.black),
                ),
              ]),
      ),
      drawer: DrawerMenu(),
      body: Stack(
        children: [
          FlutterMap(
            mapController: controller,
            options: new MapOptions(
              center: loc.latitude != null
                  ? LatLng(loc.latitude, loc.longitude)
                  : LatLng(20.5937, 78.9629),
              zoom: 10.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: loc.latitude != null
                        ? LatLng(loc.latitude, loc.longitude)
                        : LatLng(20.5937, 78.9629),
                    builder: (ctx) => new Container(
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.deepPurple,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 100,
            color: Colors.white,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  CalenderRow(
                    callBack: () {},
                    title: "Start Date",
                    dateTime: "11:00",
                  ),
                  CalenderRow(
                    callBack: () {},
                    title: "End Date",
                    dateTime: "11:00",
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.white,
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vehicles.vehicleList.length,
                    itemBuilder: (context, index) => VehicleCard(
                      vehicle: vehicles.vehicleList[index],
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.green,
                  padding: EdgeInsets.all(15),
                  elevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {},
                  child: Text(
                    "BOOK NOW",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalenderRow extends StatelessWidget {
  final Function callBack;
  final String title;
  final String dateTime;

  CalenderRow(
      {@required this.callBack, @required this.title, @required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: callBack,
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: Colors.deepPurple,
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
              Text(
                dateTime,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class VehicleCard extends StatefulWidget {
  final Vehicle vehicle;

  VehicleCard({this.vehicle});

  @override
  _VehicleCardState createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Stack(children: [
        Checkbox(
          onChanged: (value) {
            isSelected = value;
          },
          value: isSelected,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.vehicle.image,
            Text(
              widget.vehicle.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              "\u{20B9}${widget.vehicle.weekdayPrice}/hr",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ]),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}

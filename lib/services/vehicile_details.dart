import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';

class Vehicle {
  Image image;
  String name;
  double weekdayPrice;
  double weekendPrice;
  LatLng location;

  Vehicle({this.name, this.location, this.weekdayPrice, this.weekendPrice}) {
    image = Image.network(
      "https://imgd.aeplcdn.com/1280x720/bw/ec/35238/Honda-Activa-125-2018-Side-131138.jpg?wm=0",
      height: 100,
      width: 120,
      scale: 7,
    );
  }
}

class VehicleList {
  List<Vehicle> vehicleList = [
    Vehicle(
      name: "Honda Activa",
      location: LatLng(18.51854362080506, 73.87447427545175),
      weekdayPrice: 399,
      weekendPrice: 499,
    ),
    Vehicle(
      name: "Honda Activa",
      location: LatLng(18.518675873738466, 73.87732814575722),
      weekdayPrice: 399,
      weekendPrice: 499,
    ),
    Vehicle(
      name: "Honda Activa",
      location: LatLng(18.517259927206783, 73.87595699013723),
      weekdayPrice: 399,
      weekendPrice: 499,
    ),
    Vehicle(
      name: "Honda Activa",
      location: LatLng(18.527144470325666, 73.87761657716197),
      weekdayPrice: 399,
      weekendPrice: 499,
    )
  ];

  UnmodifiableListView<Vehicle> get() {
    return UnmodifiableListView(vehicleList);
  }
}

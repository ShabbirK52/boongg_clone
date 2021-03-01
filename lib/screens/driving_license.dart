import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class DrivingLicense extends StatefulWidget {
  static String id = "driving_lisence";
  @override
  _DrivingLicenseState createState() => _DrivingLicenseState();
}

class _DrivingLicenseState extends State<DrivingLicense> {
  File _front;
  File _back;
  final imagePicker = ImagePicker();

  Future getFrontImage() async {
    final image = await imagePicker.getImage(
        source: ImageSource.camera, maxWidth: 300.0, maxHeight: 125.0);
    setState(() {
      if (image != null) {
        _front = File(image.path);
      } else {
        print("no image selcted");
      }
    });
  }

  Future getBackImage() async {
    final image = await imagePicker.getImage(
        source: ImageSource.camera, maxWidth: 300.0, maxHeight: 125.0);
    setState(() {
      if (image != null) {
        _back = File(image.path);
      } else {
        print("no image selcted");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Driving Lisence',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: Container(
              height: 90,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple.shade100,
                        child: IconButton(
                          onPressed: () {
                            getFrontImage();
                          },
                          icon: Icon(Icons.badge, color: Colors.deepPurple),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Driving License: Front"),
                            Text(
                              _front == null ? "Pending" : "Uploaded",
                              style: TextStyle(color: Colors.yellow),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: Container(
              height: 90,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: getBackImage,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.purple.shade100,
                          child: Icon(
                            Icons.badge,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Driving License: Back"),
                            Text(
                              _back == null ? "Pending" : "Uploaded",
                              style: TextStyle(color: Colors.yellow),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: 300,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: _front == null ? null : Image.file(_front),
            ),
          ),
          SizedBox(
            height: 150,
            width: 300,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: _back == null ? null : Image.file(_back),
            ),
          )
        ],
      ),
    );
  }
}

// GestureDetector(
//   onTap: () {
//     getFrontImage();
//   },
//   child: CircleAvatar(
//     radius: 30,
//     backgroundColor: Colors.purple.shade100,
//     child: _front == null
//         ? Icon(
//             Icons.badge,
//             color: Colors.deepPurple,
//           )
//         : ClipOval(
//             child: Image.file(_front),
//           ),
//   ),
// ),

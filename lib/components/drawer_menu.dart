import 'package:flutter/material.dart';
import 'package:boongg_clone/screens/driving_license.dart';
import 'package:boongg_clone/screens/my_bookings.dart';
import 'package:boongg_clone/screens/faq.dart';
//import 'package:boongg_clone/screens/support.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
              color: Colors.deepPurple,
              width: double.infinity,
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 50,
                    color: Colors.grey.shade200,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phno",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            MenuItem(
              iconData: Icons.motorcycle_outlined,
              title: "My Bookings",
              callBack: () {
                Navigator.pushNamed(context, MyBookings.id);
              },
            ),
            MenuItem(
              iconData: Icons.badge,
              title: "Driving License",
              callBack: () {
                Navigator.pushNamed(context, DrivingLicense.id);
              },
            ),
            MenuItem(
              iconData: Icons.contact_support_outlined,
              title: "FAQ",
              callBack: () {
                Navigator.pushNamed(context, FAQ.id);
              },
            ),
            // MenuItem(
            //   iconData: Icons.phone,
            //   title: "Support",
            //   callBack: () {
            //     Navigator.pushNamed(context, MyBookings.id);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function callBack;

  MenuItem({this.iconData, this.title, this.callBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.deepPurple,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: callBack,
    );
  }
}

import 'package:boongg_clone/screens/enter_phone.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';


class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BOONGG",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Some random data",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Image(
                          image: AssetImage("images/scooter.jpg"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rent a bike starting at 30/Hr.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please enter your mobile number to proceed",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      height: 40,
                      child: RaisedButton(
                        elevation: 5,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, EnterPhone.id);
                        },
                        child: Row(
                          children: [
                            Flag(
                              'IN',
                              width: 25,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '+91',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// TextField(
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             prefixIcon:
//                             hintText: "+91",
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             contentPadding: EdgeInsets.all(20)),
//                       ),

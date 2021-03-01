import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'opt_check.dart';

class EnterPhone extends StatefulWidget {
  static String id = "enter_phone";

  @override
  _EnterPhoneState createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  String phNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  "Please enter your mobile number to proceed",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 300,
                  height: 60,
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Flag(
                            'IN',
                            width: 25,
                            height: 30,
                          ),
                        ),
                        Text(
                          "+91",
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (val) {
                              phNumber += val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            elevation: 0,
            padding: EdgeInsets.all(20),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text("Send OTP"),
            color: Colors.deepPurple,
            onPressed: () {
              Navigator.pushNamed(context, VerifyOTP.id);
            },
          )
        ],
      ),
    );
  }
}

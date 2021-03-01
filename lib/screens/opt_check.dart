import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'package:flutter_otp/flutter_otp.dart';

class VerifyOTP extends StatefulWidget {
  static String id = "otp_verification";

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  int otp = 1234;
  int otpEntered;
  bool isCorrect;
  SharedPreferences pref;
  FlutterOtp otpChecker;

  Future getSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  bool resultChecker(val) {
    if (val == otp) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    otpChecker = FlutterOtp();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  "Please wait, \nwe will auto verify the otp sent to you",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PinCodeTextField(
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  backgroundColor: Colors.white,
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    otpEntered = int.parse(value);
                  },
                ),
              ),
            ],
          ),
          RaisedButton(
            elevation: 0,
            padding: EdgeInsets.all(20),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text("Verify OTP"),
            color: Colors.deepPurple,
            onPressed: () async {
              isCorrect = resultChecker(otpEntered);
              var flag = otpChecker.resultChecker(otpEntered);
              if (isCorrect || flag) {
                await getSharedPreferences();
                pref.setBool('isUserVerified', true);
                Navigator.pushNamed(context, HomeScreen.id);
              } else {
                otpEntered = 0;
                print("invaid");
              }
            },
          ),
        ],
      ),
    );
  }
}

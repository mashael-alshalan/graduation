import 'dart:core';
import 'colors.dart' as color;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'NavBar.dart';

class fingerprint_reg extends StatefulWidget {
  const fingerprint_reg({Key? key}) : super(key: key);

  @override
  _fingerprintState createState() => _fingerprintState();
}

class _fingerprintState extends State<fingerprint_reg> {
  LocalAuthentication auth = LocalAuthentication();
  late bool _canCheckBiometric;
  String autherized = "Not autherized";

  late List<BiometricType> _availableBiomatric;

  Future<void> _checkBiometric() async
  {
    bool canCheckBiometric;
    try
    {
      canCheckBiometric = await auth.canCheckBiometrics;
    }
    on PlatformException catch(e)
    {
      print(e);
    }
    if(!mounted) return;
    setState(()
    {
      _canCheckBiometric = _canCheckBiometric;
    });
  }
  Future<void> _getAvailableBiometrics() async
  {
    List<BiometricType> availableBiometric;
    try
    {
      availableBiometric = await auth.getAvailableBiometrics();
    }
    on PlatformException catch(e)
    {
      print(e);
    }
    if(!mounted) return;

    setState(()
    {
      _availableBiomatric = _availableBiomatric;
    });
  }
  Future<void> _authenticate() async
  {
    bool authenticated = false;
    try
    {
      authenticated = await auth.authenticateWithBiometrics
        (
          localizedReason: "Scan your finger print to authenticate",
          useErrorDialogs: true,
          stickyAuth: false
      );
    }
    on PlatformException catch(e)
    {
      print(e);
    }
    if(!mounted) return;
    setState(()
    {
      autherized = authenticated ? "Autherized success" : "Failed to authenticate";
      print(autherized);
    });
  }
  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        actions: [
        ],
      ),
      drawer: menu(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom:180,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            SizedBox(height: 20,),
            Center(

              child: Text("Biomatric Registration",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/Fingerprint.png",
                    // width: 220,
                    height: 230,
                  ),
                ],
              ),
            ),
            Text("Fingerprint Registration",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            Text("Register using your fingerprint",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60,),
            Container(
              width: 180,
              height: 50,
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: _authenticate,
                color: color.AppColor.gradianS,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),

                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:14.0 ,horizontal: 24.0),
                  child: Text("Register", style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

}




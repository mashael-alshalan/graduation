import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavBar.dart';
import 'forgetPassword.dart';
import 'profile.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.3,
        actions: [],
      ),
      drawer: menu(),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Container(
              child: Icon(
                Icons.settings,
                color: Colors.indigo,
                size: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biomatric Selection",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => forgetpass()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            /*GestureDetector(
              onTap: (){
                showDialog(context: context,
                    builder: (BuildContext context)
                    {
                      bool _isObscure = true;
                      return AlertDialog(

                        title: Text("Change Password",
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: "Current Password",
                                  border: InputBorder.none,
                                  suffixIcon:  IconButton(
                                      icon: Icon(
                                          _isObscure ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (BuildContext context)=>forgetpass())
                                        );
                                      })),


                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: "New Password",
                                  border: InputBorder.none,
                                  suffixIcon:  IconButton(
                                      icon: Icon(
                                          _isObscure ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      })
                              ),


                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: "Confirm New Password",
                                  border: InputBorder.none,
                                  suffixIcon:  IconButton(
                                      icon: Icon(
                                          _isObscure ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      })
                              ),


                            ),
                            SizedBox(height: 20,),
                            Row(
                                children: [
                                  SizedBox(width: 50,),
                                  Container(
                                    width: 120,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      boxShadow:[
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 0.5,
                                          spreadRadius: 0.3,
                                        )
                                      ] ,
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white,

                                    ),
                                    child:Text(
                                      'Change Password',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ) ,
                                  )
                                ],
                              ),
                          ],
                        ),
                        actions: [
                          FlatButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Close")  ,
                          ),
                        ],
                      );
                    }
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),*/
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.notification_add,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reminder before 15 minutes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: false,
                      onChanged: (bool val) {},
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reminder before 30 minutes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (bool val) {},
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reminder before 60 minutes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: false,
                      onChanged: (bool val) {},
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            /*Row(
              children: [
                Icon(Icons.location_pin,
                  color: Colors.indigo,
                ),
                SizedBox(width: 8,),
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Divider(height: 15, thickness: 2,),
            SizedBox(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Allow",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]
                  ),
                ),
                Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (bool val){},
                    ))
              ],
            ),
            SizedBox(height: 30,), */
            SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                children: [
                  const SizedBox(width: 100),
                  Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0.5,
                          spreadRadius: 0.3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    child: const Text(
                      'SIGN OUT',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

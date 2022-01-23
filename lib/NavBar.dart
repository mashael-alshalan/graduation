import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_2/profile.dart';
import 'package:graduation_2/user_model.dart';

import 'home.dart';

class menu extends StatefulWidget {

  final String? userId;
  const menu({Key? key, this.userId}) : super(key: key);


  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Students")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              color: Colors.grey,

            ),
          ),
          accountEmail: Text(
            "${loggedInUser.firstName}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          currentAccountPicture: CircleAvatar(
            radius: 30.0,
            child: ClipOval(
              child: Image.asset("assets/student_pic.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),

            ),
          ),
            decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.5)),
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text('Profile'),
          onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => profile(userId:loggedInUser.uid)))
        ),
        Divider(height: 5, thickness: 2,),
        ListTile(
       leading: Icon(Icons.home_outlined),
       title: Text('Home Page'),
          onTap: ()=>null,
     ),
        Divider(height: 5, thickness: 2,),
        ListTile(
          leading: Icon(Icons.line_weight),
          title: Text('Biometric Selection'),
          onTap: ()=>null,
        ),
        Divider(height: 5, thickness: 2,),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: ()=>null,
        ),
        Divider(height: 5, thickness: 2,),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: ()=> logout(context),
        ),
        Divider(height: 5, thickness: 2,),
      ],
    ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => home()));
  }

}


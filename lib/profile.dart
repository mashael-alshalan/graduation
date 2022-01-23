import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_2/setting.dart';
import 'package:graduation_2/user_model.dart';

class profile extends StatefulWidget {

  final String? userId;
  const profile({Key? key, this.userId}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

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
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
          Icons.arrow_back,
          color: Colors.grey,
          ),
          onPressed: (){},
        ),
        actions: [
          IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.grey,
          ),
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=>setting())
            );
          },
        ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16,top: 25, right: 16) ,
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2, blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0,10),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:AssetImage(
                          "assets/PF.jpg",
                        ),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                    height: 40 ,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.grey[300],
                    ),
                    child: Icon(Icons.edit, color: Colors.indigo,),
                  )
                  )
                ],
                ),
              ),
              SizedBox(height: 35,),
              buildTextField("ID","${loggedInUser.uid}"),
              buildTextField("Name","${loggedInUser.firstName}"),
              buildTextField("E-mail","${loggedInUser.email}"),
              SizedBox(height: 35,),
              Center(
                child: Row(
                  children: [
                    SizedBox(width:70),
                  ElevatedButton(
                      onPressed: (){
                        final docUser = FirebaseFirestore.instance
                            .collection("Students").doc(loggedInUser.uid);

                        // update
                        docUser.update(
                          {
                            'uid':'122222',
                          }

                        );

                      },
                      child: Text('Update'),
                  ),
                  Container(
                    width: 200,
                    height: 50,
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
                      color: Colors.indigo,

                    ),
                    child:Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ) ,
                  )


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText,String Placeholder)
  {
    return Padding(
        padding: const EdgeInsets.only(bottom:35),
        child: TextFormField(
        decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: Placeholder,
        hintStyle: TextStyle(
        fontSize: 16,
        //fontWeight: FontWeight.bold,
        color: Colors.black,),
        ),
        ),

    );

  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart' as color;

class addsection extends StatefulWidget {
  const addsection({Key? key}) : super(key: key);
  @override
  _addsectionState createState() => _addsectionState();
}

class _addsectionState extends State<addsection> {
  Icon floatingIcon = new Icon(Icons.add);

  String _selectedtime = '8:00 AM';
  Future<void> _openTimePicker(BuildContext context) async {
    final TimeOfDay? t =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (t != null) {
      setState(() {
        _selectedtime = t.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            height: 250,
            width: 350,
            //margin: const EdgeInsets.only(left: 20,right: 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  "assets/addSection.jpg",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            //margin: const EdgeInsets.only(left: 40),
            width: 320,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.class__outlined,
                  color: Colors.grey[300],
                ),
                hintText: "Course ID",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            //margin: const EdgeInsets.only(left: 40),
            width: 320,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.class__outlined,
                  color: Colors.grey[300],
                ),
                hintText: "Course name",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            //margin: const EdgeInsets.only(left: 40),
            width: 320,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.class__outlined,
                  color: Colors.grey[300],
                ),
                hintText: "Section ID",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            //margin: const EdgeInsets.only(left: 40),
            width: 320,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.grey[300],
                ),
                hintText: "Location",
                border: InputBorder.none,
              ),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            //margin: const EdgeInsets.only(left: 40),
            width: 320,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 1),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 270,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: color.AppColor.gradianS,
                    onPressed: () {},
                    child: Text(
                      "Next to add Time and Day",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

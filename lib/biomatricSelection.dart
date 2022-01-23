import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'colors.dart' as color;
class biomatricSelection extends StatefulWidget {
  const biomatricSelection({Key? key}) : super(key: key);

  @override
  _biomatricSelectionState createState() => _biomatricSelectionState();
}

class _biomatricSelectionState extends State<biomatricSelection> {
  int _value = 0;
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
      body: Column(

       children: [
         SizedBox(height: 20,),
         Center(
           child: Container(
             child: Text(
               "Select Biometric ",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 30,
               ),
             ),
           ),
         ),
         Container(
           margin: EdgeInsets.only(left: 60,right: 40),
            child: Row(
             children: <Widget>[
               SizedBox(height: 500,),
               GestureDetector(
                 onTap: () => setState(() => _value = 0),
                 child: Container(
                   height: 140,
                   width: 140,
                   color: _value == 0 ? Colors.grey[300] : Colors.transparent,
                   child: Image.asset(
                     "assets/face.jpg",
                     width: 65,
                     height: 65,
                   ),
                 ),
               ),
               SizedBox(width: 4),
               GestureDetector(
                 onTap: () => setState(() => _value = 1),
                 child: Container(
                   height: 140,
                   width: 140,
                   color: _value == 1 ? Colors.grey[300]: Colors.transparent,
                   child: Image.asset(
                     "assets/Fingerprint.png",
                     width: 65,
                     height: 65,
                   ),
                 ),
               ),
             ],
           ),
         ),
         Center(
           child: Container(
             width:200,
             margin: const EdgeInsets.only(bottom:60,),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(29),
               child: FlatButton(
                   padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                   color: color.AppColor.gradianS,
                   onPressed: () {
                   },
                   child:Text(
                     "Select",
                     style: TextStyle(
                       color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                   )
               ),
             ),
           ),
         ),


       ],

      ),

    );
  }
}

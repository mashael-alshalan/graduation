import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'NavBar.dart';
class course extends StatefulWidget {
  const course({Key? key}) : super(key: key);

  @override
  _courseState createState() => _courseState();
}

class _courseState extends State<course> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.3,
        actions: [
        ],
      ),
      drawer: menu(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              child: Text(
                "CS122",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Row(
            children: <Widget>[
              SizedBox(width:30),
              Icon(Icons.today),
              SizedBox(width:7),
              Text("Day",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(height: 40, child: VerticalDivider(color: Colors.grey)),
              SizedBox(width:18),
              Icon(Icons.timer),
              SizedBox(width:7),
              Text("Time",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width:15),
              Container(height: 40, child: VerticalDivider(color: Colors.grey)),
              SizedBox(width:15),
              Icon(Icons.location_pin),
              SizedBox(width:7),
              Text("Location",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

            ],
          ),
          Container(height: 40, child: Divider(color: Colors.grey)),
          Row(
            children: <Widget>[
              SizedBox(width:30),
              Text("Sunday",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width:40),
              Text("10-12",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width:70),
              Icon(Icons.location_pin, color: Colors.black,)
            ],
          ),
          Container(height: 40, child: Divider(color: Colors.grey)),
          Row(
            children: <Widget>[
              SizedBox(width:20),
              Text("Wednesday",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width:20),
              Text("3-4",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
              SizedBox(width:70),
              Text("Online",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),

            ],
          ),
          SizedBox(height: 30,),

          Container(height: 40, child: Divider(color: Colors.grey)),
          Center(
            child: Container(
              child: Text(
                "Performence",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(child: AspectRatio(
                  aspectRatio: 4,
                  child: PieChart(
                    PieChartData(
                      sections: data,
                      centerSpaceRadius:3,
                    ),
                  )
              ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            child:Table(
              border: TableBorder.all(width:2, color:Colors.black45),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Absent")
                    )
                    ),
                    TableCell(
                    child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("3")
                    ),
                    ),
                  ]
                ),
              ],
            )
          ),

          Container(height: 40, child: Divider(color: Colors.grey)),
          Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,

              child:MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child:   Container(
                    padding: EdgeInsets.all(15),
                    child:Table(
                      border: TableBorder.all(width:2, color:Colors.black45),
                      children: [
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Date")
                                  )
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Time")
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Status")
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("02/03/2020")
                                  )
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("10:32")
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Late")
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("30/10/2020")
                                  )
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("-")
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Absent")
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("31/10/2020")
                                  )
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("-")
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Absent")
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("04/11/2020")
                                  )
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("-")
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Absent")
                                ),
                              ),
                            ]
                        ),
                      ],
                    )
                ),
              )
          )
          )
        ]

      ),
    );
  }
}
List<PieChartSectionData> data =[
  PieChartSectionData(title:"Absent", titleStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12) ,color: Colors.red,value: 70),
  PieChartSectionData(title:"Attend", titleStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),color: Colors.green,value: 30),

];
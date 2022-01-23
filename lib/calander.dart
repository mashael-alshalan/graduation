import 'dart:convert';

import 'event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart' as color;
class calander extends StatefulWidget {
  const calander({Key? key}) : super(key: key);

  @override
  _calanderState createState() => _calanderState();
}

class _calanderState extends State<calander> {
  late Map<DateTime, List<Event>> selectedEvent;
  late Map<DateTime, List<dynamic>> _events;
  CalendarFormat formart = CalendarFormat.month;
  DateTime selectDay = DateTime.now();
  DateTime foucsedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    selectedEvent = {};
    _events = {};
    prefsData();
    super.initState();
  }
  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _eventController = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}"))) as TextEditingController ;
    });
  }
  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }
  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvent[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.AppColor.gradianS,
        title: Text("Calander"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: formart,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                formart = _format;
              });
            },

            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            // day change
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selectDay = selectedDay;
                foucsedDay = focusedDay;
              });

              print(foucsedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectDay, date);
            },
            eventLoader: _getEventsfromDay,

            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: color.AppColor.gradianS,
                shape: BoxShape.circle,
              ),
            ),

            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: color.AppColor.gradianS,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectDay).map((Event event) => ListTile(
                title: Text(event.title),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
            context: context,
            builder: (Context) => AlertDialog(
                  title: Text("Add Event"),
                  content: TextFormField(
                    controller: _eventController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          if (_eventController.text.isEmpty) return;
                          setState(() {
                            if (selectedEvent[selectDay] != null) {
                              selectedEvent[selectDay]=
                              [ Event(title: _eventController.text)];

                            } else {
                              selectedEvent[selectDay] = [
                                Event(title: _eventController.text)
                              ];
                            }
                            _eventController.clear();
                            Navigator.pop(context);
                          });


                        },
                        child: Text("Ok")),
                  ],
                )),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

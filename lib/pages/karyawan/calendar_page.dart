import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}

late Map<DateTime, List<Event>> selectedEvents;
late Map<DateTime, List<Event>> permohonanIzin;
CalendarFormat format = CalendarFormat.month;
DateTime selectedDay = DateTime.now();
DateTime focusedDay = DateTime.now();
var add1 = TextEditingController();
final add2 = TextEditingController();
var _pageview = PageController(initialPage: 1);

final TextEditingController _eventController = TextEditingController();

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Sakit"), value: "Sakit"),
    DropdownMenuItem(child: Text("Izin"), value: "Izin"),
    DropdownMenuItem(child: Text("Keperluan Lain"), value: "Keperluan Lain"),
  ];
  return menuItems;
}

String selectedValue = "Sakit";

Future<void> getData() async {
  selectedEvents = {};
  final response =
      await http.get(Uri.parse("https://api-harilibur.vercel.app/api"));
  List<dynamic> json = jsonDecode(response.body);
  for (var i = 0; i < json.length; i++) {
    if (json[i]["is_national_holiday"] == true) {
      if (json[i]["holiday_date"].length == 9) {
        var time = json[i]["holiday_date"].substring(0, 8) +
            '0' +
            json[i]["holiday_date"].substring(8, 9);
        selectedDay = DateTime.parse(time + " 07:00:00.000").toUtc();
      } else {
        selectedDay =
            DateTime.parse(json[i]["holiday_date"] + " 07:00:00.000").toUtc();
      }
      _eventController.text = json[i]["holiday_name"];
      Event event = Event(title: _eventController.text);
      selectedEvents[selectedDay] = [event];
      selectedDay = DateTime.now();
    }
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    getData();
    setState(() {});
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.deepPurple,
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFF363567),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 24,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  children: [
                    TableCalendar(
                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      daysOfWeekVisible: true,

                      //Day Changed
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          add1.text = selectDay.toString().substring(0, 10);
                          print(selectedDay);
                          focusedDay = focusDay;
                        });
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },

                      eventLoader: _getEventsfromDay,

                      //To style the Calendar
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(color: Colors.white),
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                          // color: Colors.purpleAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        weekendDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        weekendTextStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 212, 17, 17),
                          height: 1.3333333333333333,
                        ),
                      ),
                      calendarBuilders: CalendarBuilders(
                        singleMarkerBuilder: (context, date, _) {
                          return Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            width: 5.0,
                            height: 5.0,
                            margin: const EdgeInsets.symmetric(horizontal: 1.5),
                          );
                        },
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        titleTextStyle:
                            TextStyle(fontSize: 14, color: Colors.white),
                        formatButtonTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ..._getEventsfromDay(selectedDay).map(
                      (Event event) => ListTile(
                        title: Text(
                          event.title,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

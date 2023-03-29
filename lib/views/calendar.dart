import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:final_test_schedule/common/card.dart' as Card;

DateTime _focusedDay = DateTime.now();
DateTime? _selectedDay;
CalendarFormat _calendarFormat = CalendarFormat.values[0];

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    DateTime day = DateTime.now();
    return Scaffold(
        appBar: AppBar(
          title: Text('カレンダー'),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                OutlinedButton(
                  child: const Text('今日'),
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime.now();
                      _selectedDay = DateTime.now();
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  child: Row(children: [
                    Text(
                      DateFormat('yyyy年MM月').format(day),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      onPressed: () {
                        _datePicker(context);
                      },
                    ),
                  ]),
                )
              ]),
            ),
            Center(
                child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  firstDay: DateTime.utc(2022, 4, 1),
                  lastDay: DateTime.utc(2025, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  weekendDays: const [DateTime.saturday],
                  // calendarStyle: const CalendarStyle(
                  //   weekendTextStyle: TextStyle(color: Colors.red),
                  // ),

                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      if (day.weekday == 7) {
                        return Center(
                          child: Text(
                            '日',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (day.weekday == 6) {
                        return Center(
                          child: Text(
                            '土',
                            style: TextStyle(color: Colors.blue),
                          ),
                        );
                      }
                    },
                    defaultBuilder: (context, day, focusedDay) {
                      if (day.weekday == 7) {
                        return Center(
                          child: Text(
                            day.day.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (day.weekday == 6) {
                        return Center(
                          child: Text(
                            day.day.toString(),
                            style: TextStyle(color: Colors.blue),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            day.day.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }
                    },
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(
                      () {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        // Navigator.pop(context,<Card>);
                      },
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // ignore: prefer_const_constructors
                        return Card.Card(child:Container(context);
                      },
                                      
                    );
                  },

                  // DaysOfWeekStyle(
                  //   weekendStyle:
                  //   day.weekday == 6 ? TextStyle(color: Colors.red) :
                  //     day.weekday == 7 ? TextStyle(color: Colors.blue) : null,
                  // ),

                  headerVisible: false,
                  locale: 'ja_Jp'),
            )),
          ],
        ));
  }

  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: _focusedDay,
        firstDate: DateTime(2023),
        lastDate: DateTime(2025));
    if (datePicked != null && datePicked != _focusedDay) {
      (() {
        _focusedDay = datePicked;
      });
    }
  }
}

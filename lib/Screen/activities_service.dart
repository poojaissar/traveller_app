// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:traveller_app/Screen/hotel_services.dart';
import 'package:traveller_app/Screen/service_details.dart';
// import 'package:myapp/utils.dart';

import '../utils/utils.dart';
import 'custom_appbar.dart';

class ActivityService extends StatefulWidget {
  @override
  _ActivityServiceState createState() => _ActivityServiceState();
}

class _ActivityServiceState extends State<ActivityService> {
  List<String> timeSlots = [
    '10:30 TO 11:30',
    '11:30 TO 12:30',
    '01:30 TO 02:30',
    '02:30 TO 03:30',
    '05:30 TO 06:30',
    '07:30 TO 08:30'
    // Add more time slots as needed
  ];

  String selectedTimeSlot = '';

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CommonAppBar(
        customTitle: "JUMEIRAH BEACH HOTEL",
        showBackButton: true,
        titleStyle: SafeGoogleFont(
          'Roboto',
          decoration: TextDecoration.none,
          fontSize: 15 * ffem,
          fontWeight: FontWeight.w600,
          height: 1.6449999809 * ffem / fem,
          color: Color(0xffffffff),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 641 * fem,
          decoration: BoxDecoration(
            color: Color(0xfff9f9f9),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 130 * fem,
                top: 71 * fem,
                child: Align(
                  child: SizedBox(
                    width: 100 * fem,
                    height: 14 * fem,
                    child: Text(
                      'SERVICE NAME',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Roboto',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1 * ffem / fem,
                        letterSpacing: 0.14 * fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 23 * fem,
                top: 86 * fem,
                child: Align(
                  child: SizedBox(
                    width: 321 * fem,
                    height: 340 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffedecfd),
                      ),
                      child: CalendarWidget(),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44 * fem,
                top: 401 * fem,
                child: Align(
                  child: SizedBox(
                    width: 188 * fem,
                    height: 27 * fem,
                    child: Text(
                      'Select time from available',
                      style: SafeGoogleFont(
                        'Roboto',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.6449999809 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
             Positioned(
                left: 23 * fem,
                top: 438 * fem,
                child: SizedBox(
                  width: 321 * fem,
                  height: 170 * fem,
                  child: GridView.count(
                    crossAxisCount: 3, // Specify the number of columns
                    mainAxisSpacing: 10 * fem, // Spacing between rows
                    crossAxisSpacing: 10 * fem, // Spacing between columns
                    childAspectRatio: 3, // Width to height ratio of each cell
                    children: timeSlots.map((timeSlot) {
                      return TimeSlotWidget(
                        timeSlot: timeSlot,
                        selected: selectedTimeSlot == timeSlot,
                        onTap: () {
                          setState(() {
                            selectedTimeSlot = timeSlot;
                          });
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServiceDetails(),
                            ),
                          );
  //                         						Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => HotelService()),
  // );
   
                        },
                      );
                    }).toList(), 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSlotWidget extends StatelessWidget {
  final String timeSlot;
  final bool selected;
  final VoidCallback onTap;

  const TimeSlotWidget({
    required this.timeSlot,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(timeSlot),
      onTap: onTap,
      selected: selected,
    );
  }
}



class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(DateTime.now().year - 1),
      lastDay: DateTime(DateTime.now().year + 1),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
    );
  }
}

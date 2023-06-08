// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/hotel_bookings.dart';
import 'package:traveller_app/Screen/hotel_services.dart';
import 'package:traveller_app/Screen/restaurants_list.dart';
// import 'package:myapp/utils.dart';

import '../utils/utils.dart';

bool isSyncCalendarEnabled = false;
bool isSendWhatsAppEnabled = false;
bool isSendEmailEnabled = false;

class ServiceDetails extends StatefulWidget {
  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // conformreservationFPt (560:780)
          padding: EdgeInsets.fromLTRB(20 * fem, 24 * fem, 20 * fem, 118 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfff9f9f9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupnuqbLw8 (EsEXWLonowbptwRr2UNuQb)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 144 * fem, 22 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ),
              Container(
                // servicenamefrv (560:787)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 28 * fem),
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
              Container(
                // autogroupodrhNWS (EsEXekjSUHjmpduJGRoDRH)
                width: double.infinity,
                height: 410 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // vH4 (I560:783;1:85)
                      left: 269.5 * fem,
                      top: 263.5 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 9 * fem,
                          height: 18 * fem,
                          child: Text(
                            '4',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Avenir Next LT Pro',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.125 * ffem / fem,
                              color: Color(0xffdbdbdb),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // obk (I560:784;1:85)
                      left: 231.5 * fem,
                      top: 263.5 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 9 * fem,
                          height: 18 * fem,
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Avenir Next LT Pro',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.125 * ffem / fem,
                              color: Color(0xffdbdbdb),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // K4J (I560:785;1:85)
                      left: 193.5 * fem,
                      top: 263.5 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 9 * fem,
                          height: 18 * fem,
                          child: Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Avenir Next LT Pro',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.125 * ffem / fem,
                              color: Color(0xffdbdbdb),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // p14 (560:786)
                      left: 155.5 * fem,
                      top: 263.5 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 9 * fem,
                          height: 18 * fem,
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Avenir Next LT Pro',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.125 * ffem / fem,
                              color: Color(0xffdbdbdb),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // calendarKTc (502:897)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            24 * fem, 23 * fem, 29 * fem, 31 * fem),
                        width: 320 * fem,
                        height: 410 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(8 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x16000000),
                              offset: Offset(2 * fem, 16 * fem),
                              blurRadius: 9.5 * fem,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroups16fAz2 (EsEXzkA8aRPcDimbq1s16F)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 1 * fem, 42 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  7 * fem, 0 * fem, 0 * fem, 0 * fem),
                              width: double.infinity,
                              height: 17 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // group55494pW (502:898)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 201 * fem, 1 * fem),
                                    width: 16 * fem,
                                    height: 16 * fem,
                                    child: Image.asset(
                                      'assets/final-design/images/group-5549.png',
                                      width: 16 * fem,
                                      height: 16 * fem,
                                    ),
                                  ),
                                  Container(
                                    // pmuq8 (502:903)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 1 * fem),
                                    child: Text(
                                      '6:30pm',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1 * ffem / fem,
                                        letterSpacing: 0.12 * fem,
                                        color: Color(0xffd6be1f),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // autogroup7cgxQWz (EsEYKZx6i8RtK2QLTz7CgX)
                              margin: EdgeInsets.fromLTRB(
                                  6.5 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  0.5 * fem, 0 * fem, 0 * fem, 7.5 * fem),
                              width: 260.5 * fem,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // group5551uie (502:905)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 11 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // remarksq6W (502:909)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 9 * fem),
                                          child: Text(
                                            'Remarks',
                                            style: SafeGoogleFont(
                                              'Roboto',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.1725 * ffem / fem,
                                              color: Color(0xff040404),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(16 * fem,
                                              15 * fem, 16 * fem, 15 * fem),
                                          width: double.infinity,
                                          height: 85 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xffd6be1f)),
                                            color: Color(0xffffffff),
                                            borderRadius:
                                                BorderRadius.circular(5 * fem),
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Write notes if you have any remarks',
                                              hintStyle: TextStyle(
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1725 * ffem / fem,
                                                color: Color(0xffa9a9a9),
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // group5552d2N (502:911)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        14 * fem, 6 * fem, 4.6 * fem, 6 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffd6be1f)),
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(3 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // The initial state of the switch

                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 128 * fem, 2 * fem),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Sync my calendar',
                                                style: SafeGoogleFont(
                                                  'Roboto',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.1725 * ffem / fem,
                                                  color: Color(0xff1e1e1e),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Switch(
                                          value: isSyncCalendarEnabled,
                                          onChanged: (value) {
                                            setState(() {
                                              isSyncCalendarEnabled =
                                                  value; // Update the state when the switch is toggled
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // group5552whG (502:918)
                                    padding: EdgeInsets.fromLTRB(
                                        14 * fem, 6 * fem, 4.6 * fem, 6 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffd6be1f)),
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(3 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // sendwhatsapprJS (502:923)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 136 * fem, 2 * fem),
                                          child: Text(
                                            'Send WhatsApp',
                                            style: SafeGoogleFont(
                                              'Roboto',
                                              fontSize: 10 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.1725 * ffem / fem,
                                              color: Color(0xff1e1e1e),
                                            ),
                                          ),
                                        ),
                                        Switch(
                                          value: isSendWhatsAppEnabled,
                                          onChanged: (value) {
                                            setState(() {
                                              isSendWhatsAppEnabled =
                                                  value; // Update the state when the switch is toggled
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group55526Tg (502:925)
                              margin: EdgeInsets.fromLTRB(
                                  7 * fem, 0 * fem, 0 * fem, 21 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  14 * fem, 6 * fem, 4.6 * fem, 6 * fem),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffd6be1f)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(3 * fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // sendemailyXU (502:930)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 157 * fem, 2 * fem),
                                    child: Text(
                                      'Send email',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725 * ffem / fem,
                                        color: Color(0xff1e1e1e),
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: isSendEmailEnabled,
                                    onChanged: (value) {
                                      setState(() {
                                        isSendEmailEnabled =
                                            value; // Update the state when the switch is toggled
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // confirmN3p (502:931)
                              margin: EdgeInsets.fromLTRB(
                                  7 * fem, 0 * fem, 0 * fem, 0 * fem),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelBooking()),
                                  );

                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 260 * fem,
                                  height: 30 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff5df4d),
                                    borderRadius:
                                        BorderRadius.circular(3 * fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'CONFIRM',
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}

Map<String, dynamic> data = {
  '3': {
    'category': 3, // Assign the appropriate default value
  },
};

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/utils.dart';

import '../utils/utils.dart';

class NotificationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      
      width: double.infinity,
      child: Container(
              // autogroupyn4fSYv (EsDhiTwS6mm8diSghuYn4f)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 440*fem),
              width: 320*fem,
              height: 147*fem,
              child: Stack(
                children: [
                  
                 
                  Positioned(
                    // group5568Wce (502:629)
                    left: 123*fem,
                    top: 0*fem,
                    child: Container(
                      width: 195*fem,
                      height: 147*fem,
                      child: Stack(
                        children: [
                        
                          Positioned(
                            // group5563vRU (502:631)
                            left: 1*fem,
                            top: 11*fem,
                            child: Container(
                              width: 194*fem,
                              height: 50*fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // calendarSuc (502:632)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: Container(
                                      width: 194*fem,
                                      height: 50*fem,
                                      decoration: BoxDecoration (
                                        color: Color(0xfff5df4d),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x16000000),
                                            offset: Offset(2*fem, 16*fem),
                                            blurRadius: 9.5*fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // notification9p2 (502:633)
                                    left: 55.0002441406*fem,
                                    top: 17*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 85*fem,
                                        height: 19*fem,
                                        child: Text(
                                          'Notification',
                                          style: SafeGoogleFont (
                                            'Roboto',
                                            fontSize: 16*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.1725*ffem/fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // calendarqRx (502:634)
                            left: 0*fem,
                            top: 62*fem,
                            child: Container(
                              width: 195*fem,
                              height: 32*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff5df4d),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x16000000),
                                    offset: Offset(2*fem, 16*fem),
                                    blurRadius: 9.5*fem,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // spabookingconfirmedYbG (502:635)
                            left: 9*fem,
                            top: 70*fem,
                            child: Align(
                              child: SizedBox(
                                width: 146*fem,
                                height: 17*fem,
                                child: Text(
                                  'Spa booking confirmed',
                                  style: SafeGoogleFont (
                                    'Roboto',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1725*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // calendarEU6 (502:636)
                            left: 0*fem,
                            top: 95*fem,
                            child: Container(
                              width: 195*fem,
                              height: 52*fem,
                              decoration: BoxDecoration (
                                color: Color(0xfff5df4d),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x16000000),
                                    offset: Offset(2*fem, 16*fem),
                                    blurRadius: 9.5*fem,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // yourtablebookedfordinnerXxz (502:637)
                            left: 16*fem,
                            top: 104*fem,
                            child: Align(
                              child: SizedBox(
                                width: 155*fem,
                                height: 33*fem,
                                child: Text(
                                  '2. Your table booked for dinner',
                                  style: SafeGoogleFont (
                                    'Roboto',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1725*ffem/fem,
                                    color: Color(0xffffffff),
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
   
        
      
          );
  }
}
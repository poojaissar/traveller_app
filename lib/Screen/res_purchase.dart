import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/utils.dart';

import '../utils/utils.dart';
import 'custom_appbar.dart';

class ResAndPurchase extends StatefulWidget {
  @override
  State<ResAndPurchase> createState() => _ResAndPurchaseState();
}

class _ResAndPurchaseState extends State<ResAndPurchase> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: CommonAppBar(
        customTitle: "RESERVATIONS & PURCHASES",
        showBackButton: true, // Hide the back button for this screen

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
          // servicebookingsE3x (502:1074)
          padding: EdgeInsets.fromLTRB(20 * fem, 18 * fem, 10 * fem, 0 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfff9f9f9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // searchhSE (502:398)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10 * fem, 21 * fem),
                padding: EdgeInsets.fromLTRB(
                    13.1 * fem, 10 * fem, 213 * fem, 9 * fem),
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/final-design/images/rectangle-461.png',
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // group7akv (502:400)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 11.9 * fem, 1 * fem),
                      width: 20 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/final-design/images/group-7.png', //group-5618-6sY
                        width: 20 * fem,
                        height: 20 * fem,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // searchUrJ (502:401)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 2 * fem, 0 * fem, 0 * fem),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              decoration: TextDecoration.none,
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725 * ffem / fem,
                              color: Color(0xffd6be1f),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupnkqzsAn (EsEevxmbvNH6PNXcqYNKqZ)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10 * fem, 9 * fem),
                width: 320 * fem,
                height: 100 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // pmBBU (502:1079)
                      left: 182 * fem,
                      top: 25 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 55 * fem,
                          height: 12 * fem,
                          child: Text(
                            '5:00pm   -',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1 * ffem / fem,
                              letterSpacing: 0.12 * fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // pmTen (502:1080)
                      left: 247 * fem,
                      top: 25 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 42 * fem,
                          height: 12 * fem,
                          child: Text(
                            '6:00pm',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1 * ffem / fem,
                              letterSpacing: 0.12 * fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // tuesdayfebruary19iA3Q (502:1081)
                      left: 53 * fem,
                      top: 25 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 122 * fem,
                          height: 12 * fem,
                          child: RichText(
                            text: TextSpan(
                              style: SafeGoogleFont(
                                'Roboto',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1 * ffem / fem,
                                letterSpacing: 0.12 * fem,
                                color: Color(0xff17278d),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Tuesday, February 19',
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1 * ffem / fem,
                                    letterSpacing: 0.12 * fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                ),
                                TextSpan(
                                  text: 'I',
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1 * ffem / fem,
                                    letterSpacing: 0.12 * fem,
                                    color: Color(0xffa9a9a9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle885f26 (502:1082)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 320 * fem,
                          height: 100 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                              border: Border.all(color: Color(0xffd6be1f)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  offset: Offset(3 * fem, 3 * fem),
                                  blurRadius: 8 * fem,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // dubaipalmhotelvyc (502:1083)
                      left: 103 * fem,
                      top: 20 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 96 * fem,
                          height: 12 * fem,
                          child: Text(
                            'Dubai Palm Hotel',
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1 * ffem / fem,
                              letterSpacing: 0.12 * fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // thespa6pmto7pmpp6 (502:1084)
                      left: 103 * fem,
                      top: 42 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 58 * fem,
                          height: 20 * fem,
                          child: RichText(
                            text: TextSpan(
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 10 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1 * ffem / fem,
                                letterSpacing: 0.1 * fem,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'The Spa \n',
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 0.8333333333 * ffem / fem,
                                    letterSpacing: 0.1 * fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text: '6pm to 7 pm',
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1 * ffem / fem,
                                    letterSpacing: 0.1 * fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle905WKY (502:1085)
                      left: 16 * fem,
                      top: 10 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 80 * fem,
                          height: 80 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10 * fem),
                            child: Image.asset(
                              'assets/final-design/images/rectangle-905-KQr.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // group5764cmt (622:366)
                      left: 238 * fem,
                      top: 16 * fem,

                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,

                                //  title: Text('Are you sure?',textAlign: TextAlign.center,),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/final-design/images/frame-RWv.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Bill added to hotel',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 65 * fem,
                          height: 30 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffd6be1f)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(3 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Billed',
                              style: SafeGoogleFont(
                                'Roboto',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.1725 * ffem / fem,
                                color: Color(0xfff5df4d),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // group5764cmt (622:366)
                      left: 238 * fem,
                      top: 54 * fem,
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  'Are you sure?',
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Sending cancel request',
                                                    style: TextStyle(
                                                      //fontWeight: FontWeight.bold,
                                                      color: Colors.yellow,
                                                    ),
                                                  ),
                                                  
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 65 * fem,
                          height: 30 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffd6be1f)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(3 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: SafeGoogleFont(
                                'Roboto',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.1725 * ffem / fem,
                                color: Color(0xfff5df4d),
                              ),
                            ),
                          ),
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

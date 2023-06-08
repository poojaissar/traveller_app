// ignore_for_file: unused_import, depend_on_referenced_packages, unnecessary_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:traveller_app/Screen/custom_appbar.dart';
// import 'package:myapp/final-design/privatefile.dart';
import 'package:traveller_app/utils/utils.dart';

import 'signin.dart';

// enum _MenuValues {
//   hotelbooking,
//   viewservice,
//   signout,
// }

var stringResponse;
var mapResponse;
var dataResponse;
var name;
List<Widget> data = [];
//List listdata;
List<String> listdata = <String>[];
List<Map<String, dynamic>> hotelsData = [];

// ignore: use_key_in_widget_constructors
class HotelBooking extends StatefulWidget {
  
  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  // ignore: prefer_typing_uninitialized_variables
  var containerList;

  /// this will delete cache
//String data = '';
  Map<String, dynamic> data = {};

  Future apicall() async {
    http.Response response;
    response = await http.get(
        Uri.parse("http://api.traveller.enworq.com/master/hotel/"),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q',
        });

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        dataResponse = mapResponse['results'];

        //listdata.clear();
        hotelsData.clear();
        for (var v in dataResponse) {
          Map<String, dynamic> hotelData =
              {}; 
          hotelData["id"] = v["id"];
          hotelData["name"] = v["name"];
          hotelsData.add(hotelData);
      }
      }
      );
    }
  }

  Future<void> fetchHotelData(int id) async {
    try {
      //print(" $id");
      var response = await http.get(
          Uri.parse('http://api.traveller.enworq.com/master/hotel/$id/'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q',
          });
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
        });

        Navigator.pushNamed(context, '/hotelservice',
            arguments: {'data': data});

      } else {
        // Handle API error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle connection or parsing error
      print('Error: $e');
    }
  }

  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      extendBodyBehindAppBar: true,
      
      
      appBar: CommonAppBar(
        customTitle: 'HOTEL BOOKING',
        showBackButton: false, // Hide the back button for this screen

        
        
        titleStyle: SafeGoogleFont(
                                  'Roboto',
                                  decoration: TextDecoration.none,
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.6449999809 * ffem / fem,
                                  color: Colors.white,
                                ),
      ),
      body: Stack(children: [
        Container(
            width: double.infinity,
            child: Container(
              // hotelbookingsm7L (502:394)
              padding:
                  EdgeInsets.fromLTRB(20 * fem, 20 * fem, 10 * fem, 54 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.8,
                  image: AssetImage(
                    'assets/final-design/images/image-1-bg.png',
                  ),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupf9jdCyL (EsD2qqDDdGRevHecJHf9jD)
                      margin: EdgeInsets.fromLTRB(
                          6 * fem, 0 * fem, 0 * fem, 27 * fem),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        ],
                      ),
                    ),
                    Container(
                      // searchhSE (502:398)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10 * fem, 21 * fem),
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
                    for (var names in hotelsData)
                      SingleChildScrollView(
                        child: Container(
                          // autogroups2y7zpe (EsD33VYTMWZDz5zHYTs2Y7)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 10 * fem, 10 * fem),
                          padding: EdgeInsets.fromLTRB(
                              10 * fem, 10 * fem, 10 * fem, 10 * fem),
                          width: double.infinity,
                          height: 55 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffd6be1f)),
                            color: Color(0xccffffff),
                            borderRadius: BorderRadius.circular(5 * fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(3 * fem, 3 * fem),
                                blurRadius: 8 * fem,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  // autogroupe9sdSwY (EsD3AQWbubctEMSsAdE9sd)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 2 * fem, 74 * fem, 4 * fem),
                                  height: double.infinity,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // ignore: unused_local_variable

                                        Container(
                                          // jumeirahbeachhotelnEi (502:403)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 7 * fem),
                                          // ignore: unnecessary_null_comparison
                                          child: dataResponse == null
                                              ? Container()
                                              : Text(
                                                  names['name'],
                                                  style: SafeGoogleFont(
                                                    'Roboto',
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 10 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1 * ffem / fem,
                                                    letterSpacing: 0.1 * fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                        ),

                                        Text(
                                            // checkin10022023smx (502:404)
                                            'Check in - 10/02/2023',
                                            style: SafeGoogleFont(
                                              'Roboto',
                                              decoration: TextDecoration.none,
                                              fontSize: 10 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1 * ffem / fem,
                                              letterSpacing: 0.1 * fem,
                                              color: Color(0xff000000),
                                            ))
                                      ])),
                              TextButton(
                                // group5570zLn (502:405)
                                onPressed: () {
                                  fetchHotelData(names['id']);
                                  //Navigator.pushNamed(context,'/hotelservice' ,arguments: {'id':names['id']});
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 82 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffd6be1f)),
                                    color: Color(0xfff5df4d),
                                    borderRadius:
                                        BorderRadius.circular(3 * fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'SERVICES',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.1725 * ffem / fem,
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
                  ]),
            )),
      ]),
    );
  }
}


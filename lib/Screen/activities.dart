// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/activities_service.dart';
//import 'package:myapp/utils.dart';
import 'package:traveller_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'bottom_navbar.dart';
import 'custom_appbar.dart';

class Activities extends StatefulWidget {
  final dynamic categoryData;
  final String apiUrl;

  const Activities({required this.categoryData, required this.apiUrl});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  List<dynamic> activities = [];
  List<Map<String, dynamic>> nameLogoList = [];

  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    try {
      final response = await http.get(
        Uri.parse(widget.apiUrl),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        //print(response.body);
        if (jsonData is List<dynamic>) {
          setState(() {
            activities = jsonData;
            //print(restaurants);
          });
        } else if (jsonData is Map<String, dynamic> &&
            jsonData.containsKey('results')) {
          final listData = jsonData['results'];
          //print(listData);
          for (var v in listData) {
            String name = v['name'];
            String logo = v['logo'];

            Map<String, dynamic> nameLogo = {
              'name': name,
              'logo': logo,
            };
            nameLogoList.add(nameLogo);
          }
          print(nameLogoList);

          if (listData is List<dynamic>) {
            setState(() {
              activities = listData;
              //print(restaurants);
            });
          } else {
            print('Invalid response structure: List not found');
          }
        } else {
          print('Invalid response structure');
        }
      } else {
        // Handle error status code
        print(
            'Failed to fetch Activities. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or API call errors
      print('Error fetching Activities: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CommonAppBar(
        customTitle: "JUMEIRAH BEACH HOTEL",
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
          // activitiesSgE (622:400)
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffeae8fe),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogrouplynfa1k (EsEMexZC81Ctgnoh3rLynf)
                padding:
                    EdgeInsets.fromLTRB(27 * fem, 18 * fem, 10 * fem, 10 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupi4xhtHL (EsEMCUKKt5Zp1WCwUpi4XH)
                      margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem,
                          26 * fem), // for move the content downside
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Container(
                      // activitieshGi (596:2846)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 17 * fem, 5 * fem),
                      child: Text(
                        'ACTIVITIES',
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.6449999809 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    for (var v in nameLogoList)
                      Container(
                        // group5696oae (596:2860)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 18 * fem, 10 * fem),
                        width: 305 * fem,
                        height: 100 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5 * fem),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(v['logo'])),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle930Ugn (596:2862)
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 305 * fem,
                                  height: 77 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                      gradient: LinearGradient(
                                        begin: Alignment(0, -1),
                                        end: Alignment(0, 1),
                                        colors: <Color>[
                                          Color(0xff000000),
                                          Color(0x68040404),
                                          Color(0x00d9d9d9)
                                        ],
                                        stops: <double>[0, 0, 0.552],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // funoutdoorgamesforkids8mL (596:2863)
                              left: 27 * fem,
                              top: 25 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 226 * fem,
                                  height: 14 * fem,
                                  child: Text(
                                    v['name'],
                                    style: SafeGoogleFont(
                                      'Roboto',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w900,
                                      height: 1 * ffem / fem,
                                      letterSpacing: 0.14 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // group5674Dnn (597:2950)
                              left: 209 * fem,
                              top: 70 * fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ActivityService()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 79 * fem,
                                  height: 25 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(3 * fem),
                                  ),
                                  child: Container(
                                    // group57318Px (597:2953)
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff5df4d),
                                      borderRadius:
                                          BorderRadius.circular(3 * fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'BOOK NOW',
                                        style: SafeGoogleFont(
                                          'Roboto',
                                          fontSize: 10 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1 * ffem / fem,
                                          letterSpacing: 0.1 * fem,
                                          color: Color(0xff000000),
                                        ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3, // Set the selected index as needed
        onItemTapped: (int index) {},
      ),
    );
  }
}

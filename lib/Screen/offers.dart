// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
//import 'package:myapp/utils.dart';
import 'package:traveller_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'bottom_navbar.dart';
import 'custom_appbar.dart';

class Offers extends StatefulWidget {
  final dynamic categoryData;
  final String apiUrl;

  const Offers({required this.apiUrl, required this.categoryData});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
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
            'Failed to fetch Spa & Beauty. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or API call errors
      print('Error fetching Spa & Beauty: $e');
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
          // offersEkn (597:2971)
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xcceae8fe),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupgkp7yCa (EsEKRXGs8uA4fDqgSJGkp7)
                padding:
                    EdgeInsets.fromLTRB(24 * fem, 20 * fem, 10 * fem, 28 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupukmrUQE (EsEHXfGFqdgf4g1qmcUKmR)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 26 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Container(
                      // jumeirahoffersu1g (597:2996)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 22 * fem, 7 * fem),
                      child: Text(
                        'JUMEIRAH OFFERS',
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.6449999809 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                   
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            1 * fem, 0 * fem, 15 * fem, 10 * fem),
                        width: double.infinity,
                        height: 145 * fem,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: nameLogoList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> item = nameLogoList[index];

                            return Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 10 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  38 * fem, 110 * fem, 39 * fem, 10 * fem),
                              width: 150 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xfff5df4d)),
                                borderRadius: BorderRadius.circular(20 * fem),
                                image: DecorationImage(
                                    image: NetworkImage(item['logo'])),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                child: Container(
                                  width: double.infinity,
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
                                      'PURCHASE',
                                      style: TextStyle(
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
                            );
                          },
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
        selectedIndex: 4, // Set the selected index as needed
        onItemTapped: (int index) {
          
        },
      ),
    );
  }
}

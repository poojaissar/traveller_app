// ignore_for_file: unused_import, unnecessary_null_comparison, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/spa&beauty_service.dart';
//import 'package:myapp/utils.dart';
import 'package:traveller_app/utils/utils.dart';
import 'package:http/http.dart' as http;

import 'bottom_navbar.dart';
import 'custom_appbar.dart';

class SpaAndBeauty extends StatefulWidget {
  final String apiUrl;
  final dynamic categoryData;

  const SpaAndBeauty({required this.apiUrl, required this.categoryData});

  @override
  State<SpaAndBeauty> createState() => _SpaAndBeautyState();
}

class _SpaAndBeautyState extends State<SpaAndBeauty> {
  List<dynamic> spaAndBeauty = [];
  List<Map<String, dynamic>> nameLogoList = [];

  @override
  void initState() {
    super.initState();
    fetchSpaAndBeauty();
  }

  Future<void> fetchSpaAndBeauty() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q'
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        //print(response.body);
        if (jsonData is List<dynamic>) {
          setState(() {
            spaAndBeauty = jsonData;
            //print(restaurants);
          });
        } else if (jsonData is Map<String, dynamic> &&
            jsonData.containsKey('results')) {
          final listData = jsonData['results'];
          //print(listData);
          for (var v in listData) {
            String name = v['name'];
            String logo = v['logo'];
            int id = v['id'];

            Map<String, dynamic> nameLogo = {
              'name': name,
              'logo': logo,
              'id': id,
            };
            nameLogoList.add(nameLogo);
          }
          print(nameLogoList);

          if (listData is List<dynamic>) {
            setState(() {
              spaAndBeauty = listData;
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

  Future<dynamic> fetchData(int id) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://api.traveller.enworq.com/master/service_provider/$id/service_list/'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Process the fetched data as needed
        //print("data $data"); 
         Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SpaAndBeautyService(data: data),
    ),
  );// Example: Print the fetched data
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      // Handle network or API call errors
      print('Error fetching data: $e');
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
          // spabeauty2Rc (588:552)
          width: double.infinity,
          height: 1087 * fem,
          decoration: BoxDecoration(
            color: Color(0xcceae8fe),
          ),
          child: Stack(
            children: [
              Positioned(
                // spabeautywiv (588:563)
                left: 139 * fem,
                top: 112 * fem,
                child: Align(
                  child: SizedBox(
                    width: 82 * fem,
                    height: 20 * fem,
                    child: Text(
                      'SPA & BEAUTY',
                      style: SafeGoogleFont(
                        'Roboto',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.6449999809 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // autogroupleddECE (EsDE3bNtM1jxSvnGyvLeDD)
                left: 0 * fem,
                top: 132 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      30 * fem, 13 * fem, 25 * fem, 0 * fem),
                  width: 360 * fem,
                  height: 955 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var v in nameLogoList)
                        Container(
                          // group5696iNJ (594:1224)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 10 * fem),
                          child: GestureDetector(
                            onTap: () async {
                              if (v['id'] != null) {
                                int id = v['id'] as int;
                                print("id $id");
                                dynamic data = await fetchData(id);
                              } else {
                                print('Invalid ID');
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 100 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * fem),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(v['logo'])),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    // rectangle930Nxe (588:794)
                                    left: 0 * fem,
                                    top: 0 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 305 * fem,
                                        height: 77 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10 * fem),
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
                                    // cinqmondesspaq5Y (588:797)
                                    left: 89 * fem,
                                    top: 43 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 127 * fem,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // group5704A6S (594:1232)
                left: 0 * fem,
                top: 59 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      5 * fem, 4.55 * fem, 0 * fem, 4.55 * fem),
                  width: 385 * fem,
                  height: 50 * fem,
                  decoration: BoxDecoration(
                    color: Color(0x7f000000),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // rectangle9263AE (589:1160)
                        width: 120 * fem,
                        height: 40.91 * fem,
                        child: Image.asset(
                          'assets/final-design/images/rectangle-926-a7g.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10 * fem,
                      ),
                      Container(
                        // rectangle926kqL (589:1163)
                        width: 120 * fem,
                        height: 40.91 * fem,
                        child: Image.asset(
                          'assets/final-design/images/rectangle-926-tpW.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10 * fem,
                      ),
                      Container(
                        // rectangle926tge (589:1166)
                        width: 120 * fem,
                        height: 40.91 * fem,
                        child: Image.asset(
                          'assets/final-design/images/rectangle-926.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2, // Set the selected index as needed
        onItemTapped: (int index) {},
      ),
    );
  }
}

// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:traveller_app/Screen/request_service.dart';
import 'dart:convert';

import '../utils/utils.dart';
import 'bottom_navbar.dart';
import 'custom_appbar.dart';
import 'restra_servicelist.dart';

List<String> restraData = <String>[];

class RestaurantsList extends StatefulWidget {
  final dynamic categoryData;
  final String apiUrl;

  const RestaurantsList({required this.categoryData, required this.apiUrl});

  @override
  _RestaurantsListState createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  List<dynamic> restaurants = [];
  List<Map<String, dynamic>> nameLogoList = [];

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q'
      });
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData is List<dynamic>) {
          setState(() {
            restaurants = jsonData;
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
            print(id);

            Map<String, dynamic> nameLogo = {
              'id': id,
              'name': name,
              'logo': logo,
            };
            nameLogoList.add(nameLogo);
          }
          print(nameLogoList);

          if (listData is List<dynamic>) {
            setState(() {
              restaurants = listData;
              //print(restaurants);
            });
          } else {
            print('Invalid response structure: List not found');
          }
        } else {
          print('Invalid response structure');
        }
      } else {
        print(
            'Failed to fetch restaurants. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
    }
  }

  Future<void> fetchServiceList(int serviceProviderId) async {
    final apiUrl =
        'http://api.traveller.enworq.com/master/service_provider/$serviceProviderId/service_list/';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q',
      });

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
       // print("jsonData $jsonData");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestraService(data: jsonData),
          ),
        );
      } else {
        print('API request failed with status code ${response.statusCode}');
      }
    } catch (error) {
      print('API request failed with error: $error');
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
          height: 640 * fem,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffeae8fe),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                      27 * fem, 18 * fem, 10 * fem, 10 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            1 * fem, 0 * fem, 0 * fem, 19 * fem),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 18 * fem, 5 * fem),
                        child: Text(
                          'RESTAURANTS LIST',
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.6449999809 * ffem / fem,
                            color: Color(0xff000000),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: nameLogoList.length,
                        itemBuilder: (context, index) {
                          final nameLogo = nameLogoList[index];
                          return Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 18 * fem, 10 * fem),
                            child: TextButton(
                              onPressed: () async {
                                 await fetchServiceList(nameLogo['id']);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 305 * fem,
                                height: 100 * fem,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(nameLogo['logo']),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 305 * fem,
                                          height: 77 * fem,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fem),
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
                                      left: 50 * fem,
                                      top: 43 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 205 * fem,
                                          height: 14 * fem,
                                          child: Text(
                                            nameLogo['name'],
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
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1, // Set the selected index as needed
        onItemTapped: (int index) {},
      ),
    );
  }
}

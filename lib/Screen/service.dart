// ignore_for_file: duplicate_import, unused_import, unnecessary_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/utils.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myapp/final-design/hotel-bookings.dart';
// import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:traveller_app/Screen/custom_appbar.dart';
import 'package:traveller_app/Screen/hotel_bookings.dart';
import 'package:traveller_app/Screen/restaurants_list.dart';
// import 'package:myapp/final-design/api_services.dart';
import 'package:traveller_app/utils/utils.dart';

import 'bottom_navbar.dart';
import 'request_service.dart';
//

// // var name;
// List<String> name = <String>[];
// List<String> servicename = <String>[];
// List<String> image = <String>[];
// List<String> serviceLists = <String>[];
// List<Map<String, dynamic>> hotelService = [];

List<String> RoomServiceData = <String>[];

class RoomService extends StatefulWidget {
  final dynamic categoryData;
  final String apiUrl;

  const RoomService(
      {super.key, required this.categoryData, required this.apiUrl});

  @override
  State<RoomService> createState() => _RoomServiceState();
}

class _RoomServiceState extends State<RoomService> {
  List<dynamic> roomService = [];
  List<Map<String, dynamic>> nameLogoList = [];
  List<dynamic> serviceProviderId = [];

  @override
  void initState() {
    super.initState();
    fetchRoomService();
  }

  Future<void> fetchRoomService() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q'
      });
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        // print(jsonData);  // Room Service

        if (jsonData != null) {
          if (jsonData is List<dynamic>) {
            setState(() {
              roomService = jsonData;
            });
          } else if (jsonData is Map<String, dynamic> &&
              jsonData.containsKey('results')) {
            final listData = jsonData['results'];
            for (var id in listData) {
              // print(id['id']);
              serviceProviderId.add(id['id']);
            }
            print(serviceProviderId);

            for (var id in serviceProviderId) {
              final serviceListResponse = await http.get(
                Uri.parse(
                    'http://api.traveller.enworq.com/master/service_provider/$id/service_list/'),
                headers: {
                  'Authorization':
                      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q'
                },
              );
              if (serviceListResponse.statusCode == 200) {
                final serviceListData = json.decode(serviceListResponse.body);
                if (serviceListData.containsKey('results')) {
                  final results = serviceListData['results'];
                  for (var result in results) {
                    final name = result['name'];
                    final image = result['image'];

                    Map<String, dynamic> nameLogo = {
                      'name': name,
                      'image': image,
                    };
                    nameLogoList.add(nameLogo);
                  }
                }
              } else {
                print(
                    'Failed to fetch service list. Status code: ${serviceListResponse.statusCode}');
              }
            }
            //print(nameLogoList);

            if (listData is List<dynamic>) {
              setState(() {
                roomService = listData;
              });
            } else {
              print('Invalid response structure: List not found');
            }
          } else {
            print('Invalid response structure');
          }
        } else {
          print('Failed to decode response body');
        }
      } else {
        print(
            'Failed to fetch restaurants. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        child: Container(
          // myroom6uC (548:2316)
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xcceae8fe),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupv42b33k (EsD6toJ39mxPgwHVaEV42B)
                padding:
                    EdgeInsets.fromLTRB(24 * fem, 25 * fem, 25 * fem, 24 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // weareheretoserveyouF9p (550:2412)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 24.5 * fem),
                      constraints: BoxConstraints(
                        maxWidth: 249 * fem,
                      ),
                      child: Text(
                        'WE ARE HERE TO\nSERVE YOU..',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Roboto',
                          decoration: TextDecoration.none,
                          fontSize: 32 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Center(
                      // youcanrequestroomservicesherea (550:2413)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 70.5 * fem),
                        constraints: BoxConstraints(
                          maxWidth: 249 * fem,
                        ),
                        child: Text(
                          'You can request room services here and enjoy your stay.',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 800,
                      height: 500,
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 10.0, // Spacing between columns
                        mainAxisSpacing: 10.0, // Spacing between rows
                        children: nameLogoList.map((nameLogo) {
                          final name = nameLogo['name'];
                          final image = nameLogo['image'];

                          if (name == null || image == null) {
                            return Container(); // Skip rendering this item
                          }

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Remark()),
          );
                            },
                            child: Container(
                              color: Colors
                                  .white, // Set the color of the container to white
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(
                                          10.0), // Adjust margin as needed
                                      width: 100.0, // Adjust width as needed
                                      height: 100.0, // Adjust height as needed
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(image),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              10.0), // Adjust bottom padding as needed
                                      child: Text(
                                        name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust font size as needed
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(
      //   selectedIndex: 0, // Set the selected index as needed
      //   onItemTapped: (int index) {},
      // ),
    );
  }
}

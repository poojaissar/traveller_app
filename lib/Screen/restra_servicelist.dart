// ignore_for_file: camel_case_types, use_build_context_synchronously, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/service_details.dart';
// import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/utils.dart';
import 'bottom_navbar.dart';
import 'custom_appbar.dart';

List<Map<String, dynamic>> nameLogoList = [];
bool isButtonSelected = false;
bool isMenuButtonSelected = false;
bool isDineInButtonSelected = false;
bool isRoomButtonSelected = false;

class RestraService extends StatefulWidget {
  final Map<String, dynamic> data;

  const RestraService({Key? key, required this.data}) : super(key: key);

  @override
  State<RestraService> createState() => _RestraServiceState();
}

class _RestraServiceState extends State<RestraService> {
  List<dynamic> serviceList = [];

  @override
  Widget build(BuildContext context) {
    final jsonData = widget.data;
    List<dynamic> results = [];

    if (jsonData.containsKey('results')) {
      results = jsonData['results'];
      nameLogoList.clear();

      for (var entry in results) {
        String? name = entry['name'];
        String? logo = entry['image'];

        if (name != null && logo != null) {
          Map<String, dynamic> nameLogo = {
            'name': name,
            'logo': logo,
          };

          nameLogoList.add(nameLogo);
        }
        print(nameLogoList);
      }
    } else {
      print('Invalid response structure: Results not found');
    }

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
            // foodmenu1pJ (588:851)
            width: double.infinity,
            height: 1087 * fem,
            decoration: BoxDecoration(
              color: Color(0xcceae8fe),
            ),
            child: Stack(
              children: [
                Positioned(
                  // restaurantnameh6n (560:966)
                  left: 123 * fem,
                  top: 112 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 112 * fem,
                      height: 20 * fem,
                      child: Text(
                        'RESTAURANT NAME',
                        style: SafeGoogleFont(
                          'Roboto',
                          decoration: TextDecoration.none,
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
                  left: 25 * fem,
                  top: 145 * fem,
                  child: Container(
                    width: 310 * fem,
                    height: 145 * fem,
                    child: Row(
                      children: List.generate(nameLogoList.length, (index) {
                        final item = nameLogoList[index];

                        return Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 10 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              23 * fem, 20 * fem, 10 * fem, 10 * fem),
                          width: 145 * fem,
                          height: 145 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20 * fem),
                            image: DecorationImage(
                              image: NetworkImage(item['logo'] as String),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 15 * fem, 78 * fem),
                                child: Text(
                                  item['name'] as String,
                                  style: TextStyle(
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1 * ffem / fem,
                                    letterSpacing: 0.12 * fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                width: 60 * fem,
                                height: 25 * fem,
                                decoration: BoxDecoration(
                                  color: const Color(0x38000000),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'AED 850',
                                    style: TextStyle(
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w900,
                                      height: 1 * ffem / fem,
                                      letterSpacing: 0.12 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  // autogroupvfi7yve (EsDGcwFi9npwHAfmEWvFi7)
                  left: 12 * fem,
                  top: 66 * fem,
                  child: Container(
                    width: 335 * fem,
                    height: 36 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          // group5709kpv (803:503)
                          onPressed: () async {
                            setState(() {
                              // isMenuButtonSelected =
                              //     !isMenuButtonSelected; // Toggle the selection status
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => RestraService(
                            //       serviceProviderId: 0,
                            //     ),
                            //   )
                            //   );
                          },

                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed) &&
                                    isMenuButtonSelected) {
                                  return Colors
                                      .yellow; // Set the background color when the button is pressed and selected
                                } else {
                                  return Colors
                                      .transparent; // Set the default background color
                                }
                              },
                            ),
                          ),
                          child: Container(
                            width: 80 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffd6be1f)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Center(
                              child: Text(
                                'MENU',
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

                        SizedBox(
                          width: 5 * fem,
                        ),
                        TextButton(
                          // group5709kpv (803:503)
                          onPressed: () async {
                            setState(() {
                              isDineInButtonSelected =
                                  !isDineInButtonSelected; // Toggle the selection status
                            });
                            final DateTime? selectedTime =
                                await _selectDateTime(context);
                            if (selectedTime != null) {
                              Navigator.pop(context, selectedTime);
                            }
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed) &&
                                    isDineInButtonSelected) {
                                  return Colors
                                      .yellow; // Set the background color when the button is pressed and selected
                                } else {
                                  return Colors
                                      .transparent; // Set the default background color
                                }
                              },
                            ),
                          ),
                          child: Container(
                            width: 80 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffd6be1f)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Center(
                              child: Text(
                                'DINE-IN',
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
                        SizedBox(
                          width: 5 * fem,
                        ),
                        TextButton(
                          // group5709kpv (803:503)
                          onPressed: () async {
                            setState(() {
                              // isMenuButtonSelected =
                              //     !isMenuButtonSelected; // Toggle the selection status
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => RestraService(
                            //       serviceProviderId: 0,
                            //     ),
                            //   ));
                          },

                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed) &&
                                    isMenuButtonSelected) {
                                  return Colors
                                      .yellow; // Set the background color when the button is pressed and selected
                                } else {
                                  return Colors
                                      .transparent; // Set the default background color
                                }
                              },
                            ),
                          ),
                          child: Container(
                            width: 80 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffd6be1f)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Center(
                              child: Text(
                                'TAKEAWAY',
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
                        SizedBox(
                          width: 5 * fem,
                        ),
                        TextButton(
                          // group5711s2N (803:509)
                          onPressed: () {
                            setState(() {
                              //   isButtonSelected =
                              //       !isButtonSelected; // Toggle the selection status
                              //       Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => RestraService(
                              //       serviceProviderId: 0,
                              //     ),
                              //   ),
                              // );
                            });
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed) &&
                                    isButtonSelected) {
                                  return Colors
                                      .yellow; // Set the background color when the button is pressed and selected
                                } else {
                                  return Colors
                                      .transparent; // Set the default background color
                                }
                              },
                            ),
                          ),

                          // TextButton(
                          //   onPressed: () {
                          //     // setState(() {
                          //     //   isButtonSelected =
                          //     //       !isButtonSelected; // Toggle the selection status
                          //     // });
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => RestraService(
                          //           serviceProviderId: 0,
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   style: ButtonStyle(
                          //     padding: MaterialStateProperty.all(EdgeInsets.zero),
                          //     backgroundColor:
                          //         MaterialStateProperty.resolveWith<Color>(
                          //             (Set<MaterialState> states) {
                          //       if (states.contains(MaterialState.pressed)) {
                          //         return Colors
                          //             .yellow; // Apply yellow color when pressed
                          //       } else if (isButtonSelected) {
                          //         return Colors
                          //             .yellow; // Apply yellow color when selected
                          //       } else {
                          //         return Colors.transparent;
                          //       }
                          //     }),
                          //     shape: MaterialStateProperty.all<
                          //         RoundedRectangleBorder>(
                          //       RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(3 * fem),
                          //         side: BorderSide(color: Color(0xffd6be1f)),
                          //       ),
                          //     ),
                          //   ),

                          //   child: Container(
                          //     width: 80 * fem,
                          //     height: double.infinity,
                          //     decoration: BoxDecoration(
                          //       // color: isButtonSelected
                          //       //     ? Colors.yellow
                          //       //     : Color(0xffffffff),
                          //       borderRadius: BorderRadius.circular(3 * fem),
                          //     ),
                          //     child: Center(
                          //       child: Text(
                          //         'TAKEAWAY',
                          //         style: SafeGoogleFont(
                          //           'Roboto',
                          //           fontSize: 10 * ffem,
                          //           fontWeight: FontWeight.w400,
                          //           height: 1 * ffem / fem,
                          //           letterSpacing: 0.1 * fem,
                          //           color: Color(0xff000000),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 5 * fem,
                          // ),
                          // TextButton(
                          //   // group5711s2N (803:509)
                          //   onPressed: () {
                          //     setState(() {
                          //       isRoomButtonSelected =
                          //           !isRoomButtonSelected; // Toggle the selection status
                          //           Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => RestraService(
                          //           serviceProviderId: 0,
                          //         ),
                          //       ),
                          //     );
                          //     }
                          //     );
                          //   },
                          //   style: ButtonStyle(
                          //     padding: MaterialStateProperty.all(EdgeInsets.zero),
                          //     backgroundColor:
                          //         MaterialStateProperty.resolveWith<Color>(
                          //       (Set<MaterialState> states) {
                          //         if (isRoomButtonSelected) {
                          //           return Colors
                          //               .yellow; // Set the background color when the button is selected
                          //         } else {
                          //           return Colors
                          //               .transparent; // Set the default background color
                          //         }
                          //       },
                          //     ),
                          //   ),

                          child: Container(
                            width: 80 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffd6be1f)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Center(
                              child: Text(
                                'ROOM SERVICE',
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: 1, // Set the selected index as needed
          onItemTapped: (int index) {},
        ));
  }
}

Future<DateTime?> _selectDateTime(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022),
    lastDate: DateTime(2025),
  );

  if (pickedDate != null) {
    final List<String> timeOptions = [
      '10:30 TO 11:30',
      '11:30 TO 12:30',
      '01:30 TO 02:30',
      '02:30 TO 03:30',
      '05:30 TO 06:30',
      '07:30 TO 08:30',
    ]; // Static time options
    final String? selectedTime = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Time'),
          content: SingleChildScrollView(
            child: Column(
              children: timeOptions.map((time) {
                return ListTile(
                  title: Text(time),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetails(),
                        ));
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selectedTime != null) {
      final DateTime selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        int.parse(selectedTime.split(':')[0]),
        int.parse(selectedTime.split(':')[1].split(' ')[0]),
      );
      return selectedDateTime;
    }
  }

  return null; // Return null if either date or time is not selected
}


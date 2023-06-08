// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:traveller_app/Screen/custom_appbar.dart';
import 'package:traveller_app/utils/utils.dart';
import 'bottom_navbar.dart';

class HotelService extends StatefulWidget {
  @override
  State<HotelService> createState() => _HotelServiceState();
}

class _HotelServiceState extends State<HotelService> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // print("final data $arguments");
    //var hotelImgs;
    List<String> hotelImages = <String>[];
    List<String> HotelImgs = <String>[];
    var hotels = arguments['data'];
    var hotelName = hotels['name'];
    var hotelLogo = hotels['logo'];
    var hotelImageset = hotels['hotel_info_set'];
    var hotelImgset = hotels['hotel_image_set'];
    for (var images in hotelImageset) {
      hotelImages.add(images['image']);
      hotelImages.add(images['name']);
    }
    for (var img in hotelImgset) {
      HotelImgs.add(img['image']);
    }
    // print("imgaes are $hotelImages");
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CommonAppBar(
        customTitle: hotelName,
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
      body: Center(
        child: Container(
          width: double.infinity,
          height: 1093 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  // autogrouprmzoi8n (EsD5Pvd8BAHPrLMhhirmzo)
                  left: 0 * fem,
                  top: 329 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        20 * fem, 0 * fem, 20 * fem, 0 * fem),
                    width: 360 * fem,
                    height: 764 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // for (var i in HotelNames)
                        for (var m in hotelImageset)
                          SingleChildScrollView(
                            // scrollDirection: Axis.horizontal,
                            child: Container(
                              // hotelinformationagn (566:325)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 10 * fem),
                              width: double.infinity,
                              height: 101 * fem,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(m['image']),
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20 * fem),
                                  topRight: Radius.circular(20 * fem),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  m['name'],
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    decoration: TextDecoration.none,
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w600,
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
                Positioned(
                  // group5632yXt (546:2313)
                  left: 0 * fem,
                  top: 250 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        129 * fem, 1 * fem, 130 * fem, 0 * fem),
                    width: 360 * fem,
                    height: 79 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    child: Align(
                      // logo1gSJ (502:641)
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 101 * fem,
                        height: 78 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20 * fem),
                              topRight: Radius.circular(20 * fem),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(hotelLogo),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle951DBL (622:360)
                  left: 0 * fem,
                  top: 0 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 360 * fem,
                      height: 59 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle886Tmp (502:642)
                  left: 0 * fem,
                  top: 0 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 360 * fem,
                      height: 251 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20 * fem),
                          bottomLeft: Radius.circular(20 * fem),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20 * fem),
                              topRight: Radius.circular(20 * fem),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(HotelImgs[0]),
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
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, // Set the selected index as needed
        onItemTapped: (int index) {},
      ),
    );
  }
}

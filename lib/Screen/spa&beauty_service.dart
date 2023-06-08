// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/signin.dart';

import '../utils/utils.dart';
import 'custom_appbar.dart';

String dropdownValue = 'Option 1';

class SpaAndBeautyService extends StatefulWidget {
  final dynamic data;

  const SpaAndBeautyService({Key? key, required this.data}) : super(key: key);

  @override
  State<SpaAndBeautyService> createState() => _SpaAndBeautyServiceState();
}

class _SpaAndBeautyServiceState extends State<SpaAndBeautyService> {
  List<Map<String, dynamic>> nameImageList = [];
  dynamic _receivedData;

  @override
  void initState() {
    super.initState();
    _receivedData = widget.data;
    
    if (_receivedData != null) {
      var results = _receivedData['results'];
      print(results);
     // var leaf_nodes = results['leaf_nodes'];

      
      for (var item in results) {
        var name = item['name'];
        var image = item['image'];
        var nameImageMap = {
          'name': name,
          'image': image,
        };
        nameImageList.add(nameImageMap);
      }

    print("nameImageList $nameImageList");


//  List<Map<String, dynamic>> leafNodes = [];

// if (results['leaf_nodes'] is String) {
//   var leafNodesString = results['leaf_nodes'];
//   try {
//     leafNodes = json.decode(leafNodesString);
//     if (leafNodes.isNotEmpty) {
//       for (var leaf in leafNodes) {
//         var name = leaf['name'];
//         var image = leaf['image'];
//         var leafNodesMap = {
//           'name': name,
//           'image': image,
//         };
//         print("leafNodesMap $leafNodesMap");
//       }
//     }
//   } catch (e) {
//     print("Error parsing leaf nodes data: $e");
//   }
// } else {
//   print("Invalid leaf nodes data format");
// }
  

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
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 640 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xcceae8fe),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 137 * fem,
                top: 83 * fem,
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
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: nameImageList.asMap().entries.map((entry) {
                      var index = entry.key;
                      var v = entry.value;
                      var topValue = 217 * fem + index * (337 * fem + 5 * fem);

                      return Positioned(
                        left: 23 * fem,
                        top: topValue,
                        child: Container(
                          //color: Colors.white,
                          width: 313 * fem,
                          height: 100 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                  10 * fem,
                                  120 * fem,
                                  0 * fem,
                                  10 * fem,
                                ),
                                child: Text(
                                  v['name'],
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.6449999809 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.white,
                                margin: EdgeInsets.fromLTRB(
                                  10 * fem,
                                  0 * fem,
                                  0 * fem,
                                  10 * fem,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 83 * fem,
                                        height: 50 * fem,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5 * fem),
                                            bottomLeft:
                                                Radius.circular(5 * fem),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              // Handle image click
                                            },
                                            child: Image(
                                              image: NetworkImage(v['image']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


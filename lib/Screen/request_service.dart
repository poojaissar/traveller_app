import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/service.dart';
// import 'package:myapp/utils.dart';

import '../utils/utils.dart';

class Remark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
       extendBodyBehindAppBar: true,
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
          // remarkzqk (560:311)
          padding:
              EdgeInsets.fromLTRB(20 * fem, 100 * fem, 20 * fem, 154 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/final-design/images/rectangle-918-bg.png',
              ),
            ),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                // calendarkTY (502:768)
                padding: EdgeInsets.fromLTRB(
                    27.5 * fem, 66 * fem, 29 * fem, 46 * fem),
                width: double.infinity,
                height: 331 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x16000000),
                      offset: Offset(2 * fem, 16 * fem),
                      blurRadius: 9.5 * fem,
                    ),
                  ],
                ),
                child: Container(
                  // autogroupjzu33Bk (EsD9K9RrJzbeSb5k84jZU3)
                  padding: EdgeInsets.fromLTRB(
                      3.5 * fem, 11 * fem, 0 * fem, 0 * fem),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 21 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5 * fem),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 7 * fem),
                              child: Text(
                                'Remarks',
                                style: SafeGoogleFont(
                                  'Roboto',
                                  decoration: TextDecoration.none,
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1725 * ffem / fem,
                                  color: Color(0xff040404),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  16 * fem, 15 * fem, 16 * fem, 15 * fem),
                              width: double.infinity,
                              height: 121 * fem,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffd6be1f)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: Material(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                        'Write notes if you have any remarks',
                                    hintStyle: TextStyle(
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1725 * ffem / fem,
                                      color: Color(0xffa9a9a9),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725 * ffem / fem,
                                    color: Colors.black,
                                  ),
                                  maxLines:
                                      null, // Allow the input box to wrap content
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        // booknowqWv (502:775)
                        onPressed: () {
                           Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 44 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xfff5df4d),
                            borderRadius: BorderRadius.circular(3 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'SEND',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
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
    );
  }
}

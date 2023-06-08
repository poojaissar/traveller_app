// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/utils/utils.dart';

import 'signup.dart';
// import 'package:myapp/final-design/traveller-signup-.dart';
// import 'package:myapp/utils.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: TextButton(
        // firstopenWuL (502:301)
        onPressed: () {},
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: InkWell(
           onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
          return Signup();
         }));
      },
          child: Container(
            width: double.infinity,
            height: 640*fem,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
              gradient: LinearGradient (
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: <Color>[Color(0xff4c6cde), Color(0x004c6cde)],
                stops: <double>[0, 1],
              ),
            ),
            child: Center(
              child: Text(
                'Traveller App',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Roboto',
                  fontSize: 36*ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.1725*ffem/fem,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
      ),
          );
  }
}
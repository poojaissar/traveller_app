// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/signin.dart';

import '../app/models/users.dart';
import '../utils/utils.dart';

import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isChecked = false;
  String name = '';
  String mobile = '';
  String email = '';
  String password = '';
  int userType = 4;
  bool twoStepVerification = false;
  bool deviceAuthenticator = false;
  bool otpVerification = false;


  Future<void> signup() async {
    // Create a User object with the form values
     User user = User(name: name, email: email,mobile:mobile, password: password,userType:userType,twoStepVerification:twoStepVerification,deviceAuthenticator:deviceAuthenticator,otpVerification:otpVerification);

    // Prepare the request body
    Map<String, dynamic> requestBody = user.toJson();
    print(user.toJson());

    // Make the API call
    Uri url = Uri.parse('http://api.traveller.enworq.com/foundation/auth/register/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );


    // Check the response status code
    if (response.statusCode == 200) {
      // Successful signup
      print('Signup successful');
    } else {
      // Signup failed
      print('Signup failed with status code: ${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // travellersignupcer (818:410)
        width: double.infinity,
        height: 640 * fem,
        child: Container(
          // travellersignupkm4 (502:303)
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                // rectangle8904mk (502:304)
                left: 0 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 373 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff9f9f9),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // orangebg8mc (655:432)
                left: 0 * fem,
                top: 247 * fem,
                child: Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 494 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50 * fem),
                          topRight: Radius.circular(50 * fem),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment(0, -1),
                          end: Alignment(0, 1),
                          colors: <Color>[Color(0xff4c6cde), Color(0x004c6cde)],
                          stops: <double>[0, 1],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // travellerappn5U (502:306)
                left: 120 * fem,
                top: 31 * fem,
                child: Align(
                  child: SizedBox(
                    width: 120 * fem,
                    height: 24 * fem,
                    child: Text(
                      'Traveller App',
                      style: SafeGoogleFont(
                        'Roboto',
                        decoration: TextDecoration.none,
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.1725 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // signup42z (502:307)
                left: 23 * fem,
                top: 70 * fem,
                child: Container(
                  width: 152.78 * fem,
                  height: 44 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd6be1f)),
                    color: Color(0xff4c6cde),
                    borderRadius: BorderRadius.circular(3 * fem),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: Color(0xfffffcfc),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: SafeGoogleFont(
                              'Roboto',
                              decoration: TextDecoration.none,
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.1725 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // signin2ZU (502:310)
                left: 187 * fem,
                top: 70 * fem,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 150 * fem,
                    height: 44 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4c6cde)),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(3 * fem),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SignIn();
                        }));
                      },
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: SafeGoogleFont(
                            'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // applesigninGTp (502:313)
                left: 23 * fem,
                top: 178 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      91 * fem, 12 * fem, 90 * fem, 12 * fem),
                  width: 313 * fem,
                  height: 44 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff4c6cde)),
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(3 * fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // appleoriginalhJE (502:315)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 13 * fem, 1.21 * fem),
                        width: 20 * fem,
                        height: 18.79 * fem,
                        child: Image.asset(
                          'assets/final-design/images/apple-original.png',
                          width: 20 * fem,
                          height: 18.79 * fem,
                        ),
                      ),
                      Container(
                        // signupwithapplePRx (502:316)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Sign up with Apple',
                          style: SafeGoogleFont(
                            'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xffa9a9a9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // fullnamegR4 (502:317)
                left: 24 * fem,
                top: 337 * fem,
                child: Container(
                  width: 313 * fem,
                  height: 58 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // mobilenumberyf4 (502:320)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 3 * fem),
                        child: Text(
                          'Mobile number',
                          style: SafeGoogleFont(
                            'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // group5510r8W (502:322)
                        width: double.infinity,
                        height: 40 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3 * fem),
                        ),
                        child: Container(
                          // group5437bLz (502:323)
                          padding: EdgeInsets.fromLTRB(
                              11 * fem, 9 * fem, 11 * fem, 9 * fem),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff4c6cde)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(3 * fem),
                          ),
                          child: Container(
                            // group5509iAi (502:325)
                            width: 143 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Material(
                                  child: SizedBox(
                                    width: 200,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 3 * fem, 0 * fem, 0 * fem),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            mobile = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: '000 1245 2311',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Roboto',
                                            decoration: TextDecoration.none,
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1725 * ffem / fem,
                                            color: Color(0xffa9a9a9),
                                          ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 14.0),
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
                // group57778gN (797:368)
                left: 24 * fem,
                top: 271 * fem,
                child: Container(
                  width: 313 * fem,
                  height: 58 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // fullnamee8v (797:367)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 3 * fem),
                        child: Text(
                          'Full Name',
                          style: SafeGoogleFont(
                            'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // group5510r8W (502:322)
                        width: double.infinity,
                        height: 40 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3 * fem),
                        ),
                        child: Container(
                          // group5437bLz (502:323)
                          padding: EdgeInsets.fromLTRB(
                              11 * fem, 9 * fem, 11 * fem, 9 * fem),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff4c6cde)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(3 * fem),
                          ),
                          child: Container(
                            // group5509iAi (502:325)
                            width: 143 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Material(
                                  child: SizedBox(
                                    width:
                                        200, // Set the desired width for the input field
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 3 * fem, 0 * fem, 0 * fem),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            name = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              'Enter your full name e.g - Zara Lee',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Roboto',
                                            decoration: TextDecoration.none,
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1725 * ffem / fem,
                                            color: Color(0xffa9a9a9),
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 14.0),
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
                // emailaddressS4n (502:321)
                left: 24 * fem,
                top: 402 * fem,
                child: Container(
                  width: 313 * fem,
                  height: 58 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // emailaddressw1Y (502:328)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 3 * fem),
                        child: Text(
                          'E-mail address',
                          style: SafeGoogleFont(
                            'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // group5510r8W (502:322)
                        width: double.infinity,
                        height: 40 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3 * fem),
                        ),
                        child: Container(
                          // group5437bLz (502:323)
                          padding: EdgeInsets.fromLTRB(
                              11 * fem, 9 * fem, 11 * fem, 9 * fem),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff4c6cde)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(3 * fem),
                          ),
                          child: Container(
                            // group5509iAi (502:325)
                            width: 143 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group28doU (502:326)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 11 * fem, 0 * fem),
                                  width: 22 * fem,
                                  height: 22 * fem,
                                  child: Image.asset(
                                    'assets/final-design/images/group-28.png',
                                    width: 22 * fem,
                                    height: 22 * fem,
                                  ),
                                ),
                                Material(
                                  child: SizedBox(
                                    width: 200,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 3 * fem, 0 * fem, 0 * fem),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            email = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Enter e-mail address',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Roboto',
                                            decoration: TextDecoration.none,
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1725 * ffem / fem,
                                            color: Color(0xffa9a9a9),
                                          ),
                                          enabledBorder: InputBorder
                                              .none, // Remove the underline
                                          focusedBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical:
                                                  14.0), // Remove the underline when focused
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
                // createaccountrAS (502:329)
                left: 23 * fem,
                top: 573 * fem,
                child: TextButton(
                  onPressed: () {
                    signup();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 313 * fem,
                    height: 44 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                      borderRadius: BorderRadius.circular(3 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Create account',
                        style: SafeGoogleFont(
                          'Roboto',
                          decoration: TextDecoration.none,
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.1725 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group5519J2S (502:333)
                left: 24 * fem,
                top: 467 * fem,
                child: Container(
                  width: 313 * fem,
                  height: 57 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // password1xS (502:334)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 2 * fem),
                        child: Text(
                          'Password',
                          style: SafeGoogleFont(
                            'Roboto',
                            decoration: TextDecoration.none,
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupf4xrgYn (EsD1h2oC3F2B5BXwuuf4XR)
                        padding: EdgeInsets.fromLTRB(
                            16.9 * fem, 11.52 * fem, 16.9 * fem, 9 * fem),
                        width: double.infinity,
                        height: 40 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff4c6cde)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(3 * fem),
                        ),
                        child: Container(
                          // group5513PTC (502:336)
                          width: 100.1 * fem,
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // group101L7Y (502:337)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13.15 * fem, 2.52 * fem),
                                width: 13.96 * fem,
                                height: 16.96 * fem,
                                child: Image.asset(
                                  'assets/final-design/images/group-101.png',
                                  width: 13.96 * fem,
                                  height: 16.96 * fem,
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: SizedBox(
                                  width: 200,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 3 * fem, 0 * fem, 0 * fem),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: '**************',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Roboto',
                                          decoration: TextDecoration.none,
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725 * ffem / fem,
                                          color: Color(0xff272727),
                                        ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 14.0),
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
              Positioned(
                // orzC6 (502:339)
                left: 172 * fem,
                top: 223 * fem,
                child: Align(
                  child: SizedBox(
                    width: 13 * fem,
                    height: 17 * fem,
                    child: Text(
                      'or',
                      style: SafeGoogleFont(
                        'Roboto',
                        decoration: TextDecoration.none,
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // policygqc (502:340)
                left: 26 * fem,
                top: 535 * fem,
                child: Container(
                  padding:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 29 * fem, 0 * fem),
                  width: 307 * fem,
                  height: 28 * fem,
                  decoration: BoxDecoration(
                    color: Colors
                        .transparent, // Set the background color to transparent
                    borderRadius: BorderRadius.circular(1 * fem),
                  ),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: Container(
                              color: Colors
                                  .transparent, // Set the background color to transparent
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              constraints: BoxConstraints(
                                maxWidth: 255 * fem,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xffa9a9a9),
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'By checking this, you are accepting our ',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725 * ffem / fem,
                                        color: Color.fromARGB(255, 15, 14, 14),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'privacy Policy',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725 * ffem / fem,
                                        color: Color.fromARGB(255, 26, 25, 25),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' of our website.',
                                      style: SafeGoogleFont(
                                        'Roboto',
                                        decoration: TextDecoration.none,
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725 * ffem / fem,
                                        color: Color.fromARGB(255, 12, 12, 12),
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
                ),
              ),
              Positioned(
                // rectangle597A3x (502:343)
                left: 23 * fem,
                top: 124 * fem,
                child: Align(
                  child: SizedBox(
                    width: 314 * fem,
                    height: 44 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3 * fem),
                        border: Border.all(color: Color(0xff4c6cde)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // signupwithgooglesDG (502:344)
                left: 144 * fem,
                top: 139 * fem,
                child: Align(
                  child: SizedBox(
                    width: 105 * fem,
                    height: 15 * fem,
                    child: Text(
                      'Sign up with google',
                      style: SafeGoogleFont(
                        'Roboto',
                        decoration: TextDecoration.none,
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725 * ffem / fem,
                        color: Color(0xffa9a9a9),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group5525yGJ (502:345)
                left: 119 * fem,
                top: 138 * fem,
                child: Align(
                  child: SizedBox(
                    width: 15 * fem,
                    height: 16 * fem,
                    child: Image.asset(
                      'assets/final-design/images/group-5525.png',
                      width: 15 * fem,
                      height: 16 * fem,
                    ),
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

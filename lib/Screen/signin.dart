// ignore_for_file: unused_import, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/hotel_bookings.dart';
import 'package:traveller_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'signup.dart';
// import 'package:myapp/final-design/traveller-signup-.dart';
// import 'package:myapp/utils.dart';

// import 'hotel-bookings.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = false;
  String email = '';
  String password = '';
  bool rememberMe = false;

  Future<void> login() async {
    // if (rememberMe) {
    //   saveCredentials(email, password);
    // }
    // Prepare the request body
    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };

    // Make the API call
    Uri url =
        Uri.parse('http://api.traveller.enworq.com/foundation/auth/login/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Successful login
      print('Login successful');

      // Parse the response body
      // Map<String, dynamic> responseData = jsonDecode(response.body);
      // print(responseData);
      // String refreshToken = responseData['refresh'];
      // print("refreshToken $refreshToken");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HotelBooking()),
      );
    } else {
      // Login failed
      print('Login failed with status code: ${response.statusCode}');
    }
  }
 @override
  void initState() {
    super.initState();
    loadSavedCredentials();
  }
   Future<void> loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;

      if (rememberMe) {
        password = prefs.getString('password') ?? '';
      }
    });
  }
   Future<void> saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setBool('rememberMe', rememberMe);

    if (rememberMe) {
      await prefs.setString('password', password);
    } else {
      await prefs.remove('password');
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
        // travellersigninzdC (818:411)
        width: double.infinity,
        height: 640 * fem,
        child: Container(
          // travellersigninY8v (502:350)
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                // greybgrQW (502:351)
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
                // orangebgZ42 (502:352)
                left: 0 * fem,
                top: 278 * fem,
                child: Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 461 * fem,
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
                // travellerappoj4 (502:353)
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
                // emailaddressgnr (502:354)
                left: 24 * fem,
                top: 300 * fem,
                child: Container(
                  width: 313 * fem,
                  height: 62 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // emailaddressNfg (502:361)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 7 * fem),
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
                        // group55106Ln (502:355)
                        width: double.infinity,
                        height: 40 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3 * fem),
                        ),
                        child: Container(
                          // group5437qJN (502:356)
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
                            // group5509Yia (502:358)
                            width: 143 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group28Us8 (502:359)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 11 * fem, 0 * fem),
                                  width: 22 * fem,
                                  height: 22 * fem,
                                  child: Image.asset(
                                    'assets/final-design/images/group-28-N4E.png',
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
                // group5524hUz (502:362)
                left: 23 * fem,
                top: 510 * fem,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: InkWell(
                    onTap: () {
                      login();
                    },
                    child: Container(
                      width: 313 * fem,
                      height: 44 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xff000000),
                        borderRadius: BorderRadius.circular(3 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
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
              ),
              Positioned(
                // group551984W (502:366)
                left: 24 * fem,
                top: 371 * fem,
                child: Container(
                  width: 313 * fem,
                  height: 62 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // password3xA (502:367)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 7 * fem),
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
                        // autogroup9tesmtA (EsD2Hr8Wf4BX5kfKoM9tes)
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
                          // group55135tr (502:369)
                          width: 100.1 * fem,
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // group101pbY (502:370)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 13.15 * fem, 2.52 * fem),
                                width: 13.96 * fem,
                                height: 16.96 * fem,
                                child: Image.asset(
                                  'assets/final-design/images/group-101-NFQ.png',
                                  width: 13.96 * fem,
                                  height: 16.96 * fem,
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
                // group5526URC (502:372)
                left: 27 * fem,
                top: 453 * fem,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 87 * fem,
                    height: 16 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1 * fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                        ),
                        Container(
                          // rememberJ9L (502:374)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 1 * fem, 0 * fem, 0 * fem),
                          child: Text(
                            'Remember',
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
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // forgotpasswordQiA (502:375)
                left: 240 * fem,
                top: 570 * fem,
                child: Align(
                  child: SizedBox(
                    width: 96 * fem,
                    height: 15 * fem,
                    child: Text(
                      'Forgot password?',
                      style: SafeGoogleFont(
                        'Roboto',
                        decoration: TextDecoration.none,
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group5587J2r (502:376)
                left: 23 * fem,
                top: 90 * fem,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Signup();
                      }));
                    },
                    child: Container(
                      width: 152.78 * fem,
                      height: 44 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff4c6cde)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(3 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
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
                // signinw5p (502:379)
                left: 187 * fem,
                top: 90 * fem,
                // child: InkWell(
                //    onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                //       return HotelBooking();
                //     }));
                //   },
                child: Container(
                  width: 150 * fem,
                  height: 44 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff4c6cde)),
                    color: Color(0xff4c6cde),
                    borderRadius: BorderRadius.circular(3 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: SafeGoogleFont(
                        'Roboto',
                        decoration: TextDecoration.none,
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.1725 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              // ),
              Positioned(
                // applesigninbAN (502:382)
                left: 23 * fem,
                top: 198 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      91 * fem, 12 * fem, 94 * fem, 12 * fem),
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
                        // appleoriginale8e (502:384)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 13 * fem, 1.21 * fem),
                        width: 20 * fem,
                        height: 18.79 * fem,
                        child: Image.asset(
                          'assets/final-design/images/apple-original-JWJ.png',
                          width: 20 * fem,
                          height: 18.79 * fem,
                        ),
                      ),
                      Container(
                        // signinwithapplejft (502:385)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Sign in with Apple',
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
                // orFPL (502:386)
                left: 172 * fem,
                top: 253 * fem,
                child: Align(
                  child: SizedBox(
                    width: 13 * fem,
                    height: 17 * fem,
                    child: Text(
                      'or',
                      style: SafeGoogleFont(
                        'Roboto',
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
                // rectangle597ZQ2 (502:387)
                left: 23 * fem,
                top: 144 * fem,
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
                // signinwithgoogle57U (502:388)
                left: 144 * fem,
                top: 159 * fem,
                child: Align(
                  child: SizedBox(
                    width: 101 * fem,
                    height: 15 * fem,
                    child: Text(
                      'Sign in with google',
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
                // group5588mFC (502:389)
                left: 118 * fem,
                top: 158 * fem,
                child: Align(
                  child: SizedBox(
                    width: 15 * fem,
                    height: 16 * fem,
                    child: Image.asset(
                      'assets/final-design/images/group-5588.png',
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

// ignore_for_file: unused_import, duplicate_import

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/Screen/custom_appbar.dart';
import 'package:traveller_app/Screen/hotel_bookings.dart';
import 'package:traveller_app/utils/utils.dart';
import 'Screen/first_screen.dart';
import 'Screen/hotel_services.dart';
import 'Screen/restaurants_list.dart';
import 'Screen/service.dart';
import 'Screen/signup.dart';




void main()  {
  
  runApp(MyApp());
  }

class MyApp extends StatefulWidget {


  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {





	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Traveller App',
    initialRoute: '/',
     routes: {
        '/traveller_signup': (context) => Signup(),
        '/home_screen': (context) => WelcomeScreen(),
        // '/notification': (BuildContext context) => NotificationBar(),
        '/hotelservice':(BuildContext context) => HotelService(),
        
        // '/service':(BuildContext context) => RoomService(),
       // '/restralist':(BuildContext context) => RestaurantsList(),
        // '/spanbeauty':(BuildContext context) => SpaAndBeauty(),
        // '/activities':(BuildContext context) => Activities(),
        // '/offers':(BuildContext context) => Offers(),
        

      },
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: Scaffold(
      extendBodyBehindAppBar: true,
		body: SingleChildScrollView(
			child: WelcomeScreen(),
		),
		),
    
	);
	}
}

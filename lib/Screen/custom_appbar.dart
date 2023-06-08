// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:traveller_app/Screen/res_purchase.dart';
import 'package:traveller_app/utils/utils.dart';

import 'hotel_bookings.dart';
import 'notification.dart';
import 'signin.dart';
import 'package:http/http.dart' as http;

enum _MenuValues {
  hotelbooking,
  viewservice,
  signout,
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String customTitle;
  final TextStyle titleStyle;
  final bool showBackButton;
  CommonAppBar(
      {required this.customTitle,
      required this.titleStyle,
      required this.showBackButton,
      });



  @override
  Future<void> logout(String refreshToken) async {
  // Prepare the request body
  Map<String, dynamic> requestBody = {'refresh_token': refreshToken};

  // Make the API call
  Uri url = Uri.parse('http://api.traveller.enworq.com/foundation/auth/logout/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(requestBody),
  );
print(response);
  // Check the response status code
  if (response.statusCode == 200) {
    // Logout successful
    print('Logout successful');
  } else {
    // Logout failed
    print('Logout failed with status code: ${response.statusCode}');
  }
}

  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackButton,

      // ignore: unnecessary_null_comparison
      title: customTitle != null
          ? Text(
              customTitle,
              style: titleStyle,
            )
          : null,

      //automaticallyImplyLeading: false,
      backgroundColor:
          Colors.transparent, // Set the app bar background color to transparent
      elevation: 20,

      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ResAndPurchase()),
  );
            // Handle notification button press
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/final-design/images/group-5728-8wg.png', // Replace with the path to your notification icon image
              width: 48, // Set the width of the image
              height: 38, // Set the height of the image
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showNotificationPopup(context);
            // Handle notification button press
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/final-design/images/group-5617-hk2.png', // Replace with the path to your notification icon image
              width: 48, // Set the width of the image
              height: 38, // Set the height of the image
            ),
          ),
        ),
        // IconButton(onPressed: (){}, icon: Icon(Icons.notifications),iconSize: 35,color: Colors.black,),

        PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            color: Colors.yellow,
            iconSize: 40,
            //iconSize: ffem,
            itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text(
                      "Hotel Bookings",
                      style: SafeGoogleFont(
                        'Roboto',
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                    value: _MenuValues.hotelbooking,
                  ),
                  PopupMenuItem(
                    child: Text(
                      "View Services",
                      style: SafeGoogleFont(
                        'Roboto',
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                    value: _MenuValues.viewservice,
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Sign out",
                      style: SafeGoogleFont(
                        'Roboto',
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                    value: _MenuValues.signout,
                  ),
                ],
            onSelected: (value) async {
              switch (value) {
                case _MenuValues.hotelbooking:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => HotelBooking()));
                  break;

                case _MenuValues.viewservice:
                  // TODO: Handle this case.
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => ResAndPurchase()));
                  break;
                case _MenuValues.signout:
                logout;
                Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => SignIn(),
  ),
);
                break;
              }
            }),

        // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),color: Colors.black,iconSize: 40,)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

void showNotificationPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: NotificationBar(),
      );
    },
  );
}

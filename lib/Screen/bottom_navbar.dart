// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:traveller_app/Screen/activities.dart';
import 'package:traveller_app/Screen/hotel_services.dart';
import 'package:traveller_app/Screen/offers.dart';
import 'package:traveller_app/Screen/service.dart';
import 'package:http/http.dart' as http;
import 'package:traveller_app/Screen/spa&beauty.dart';
import 'dart:convert';

import 'restaurants_list.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<String> serviceProviders = <String>[];

  Map<String, dynamic> data = {};

  Future<void> fetchHotelServices(List<int> idList) async {
    try {
      for (int id in idList) {
        // First API call to fetch hotel services
        var response = await http.get(
          Uri.parse('http://api.traveller.enworq.com/master/service_list/$id/'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q',
          },
        );
        if (response.statusCode == 200) {
          //print(response.body);
          var services = jsonDecode(response.body);

          // Second API call to fetch the category for the current ID
          var getCategory = await http.get(
            Uri.parse(
                'http://api.traveller.enworq.com/master/service_provider/$id/'),
            headers: {
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDExNDI2LCJqdGkiOiJiOGQ2YjczZTAzZGE0NWNlYTQ4MzlmOGViZWFkZWM5YSIsInVzZXJfaWQiOjE2fQ.6q6YT8mvCh2VjlRysEbx2RU--JHqbm2K1Jy7NuKuD0Q',
            },
          );

          if (getCategory.statusCode == 200) {
            //print(getCategory.body);
            var category = jsonDecode(getCategory.body)['category'];

            // Combine the services and category into a single data object
            var dataObject = {
              'services': services,
              'category': category,
            };
            print(dataObject);
            setState(() {
              data[id.toString()] = dataObject;
            });
          } else {
            // Handle API error for the second API call
            print('Error for ID $id: ${getCategory.statusCode}');
          }
        } else {
          // Handle API error for the first API call
          print('Error for ID $id: ${response.statusCode}');
        }
      }
      Navigator.pushNamed(context, '/service', arguments: {'data': data});
    } catch (e) {
      // Handle connection or parsing error
      print('Error: $e');
    }
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Map<String, dynamic> data = {
      '2': {
        'category': 2, // Assign the appropriate default value
      },
      '3': {
        'category': 3, // Assign the appropriate default value
      },
      '4': {
        'category': 4, // Assign the appropriate default value
      },
      '5': {
        'category': 5, // Assign the appropriate default value
      },
      '6': {
        'category': 6, // Assign the appropriate default value
      },
    };

    // Navigate to the respective page based on the tapped index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomService(
              apiUrl:
                  'http://api.traveller.enworq.com/master/service_provider/?category=2',
              categoryData: data['2']['category'],
            ),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantsList(
              apiUrl:
                  'http://api.traveller.enworq.com/master/service_provider/?category=3',
              categoryData: data['3']['category'],
            ),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpaAndBeauty(
              apiUrl:
                  'http://api.traveller.enworq.com/master/service_provider/?category=4',
              categoryData: data['4']['category'],
            ),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Activities(
              apiUrl:
                  'http://api.traveller.enworq.com/master/service_provider/?category=5',
              categoryData: data['5']['category'],
            ),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Offers(
              apiUrl:
                  'http://api.traveller.enworq.com/master/service_provider/?category=6',
              categoryData: data['6']['category'],
            ),
          ),
        );
        break;
      // Add cases for other pages as needed
    }
  }

  @override
 Widget build(BuildContext context) {
  final arguments = ModalRoute.of(context)!.settings.arguments;
  if (arguments != null && arguments is Map<dynamic, dynamic>) {
    var hotels = arguments['data'];
    List<int> serviceProvidersInt = [];

    if (hotels != null && hotels['service_providers'] != null) {
      serviceProvidersInt = List<int>.from(hotels['service_providers']);
    }

    serviceProviders =
        serviceProvidersInt.map((value) => value.toString()).toList();
  }
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.3,
            child: Image.asset(
              'assets/final-design/images/group-E2i.png', // Replace with your own image path
              width: 44,
              height: 44,
            ),
          ),
          label: '',
          backgroundColor: Color.fromARGB(255, 8, 8, 8),
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.5,
            child: Image.asset(
              'assets/final-design/images/group-39g.png', // Replace with your own image path
              width: 44,
              height: 44,
            ),
          ),
          label: '',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.3,
            child: Image.asset(
              'assets/final-design/images/group-FwU.png', // Replace with your own image path
              width: 44,
              height: 44,
            ),
          ),
          label: '',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.3,
            child: Image.asset(
              'assets/final-design/images/group-Nm4.png',
              // Replace with your own image path
              width: 44,
              height: 44,
            ),
          ),
          label: '',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 1.2,
            child: Image.asset(
              'assets/final-design/images/group-hgA.png', // Replace with your own image path
              width: 44,
              height: 44,
            ),
          ),
          label: '',
          backgroundColor: Colors.black,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      iconSize: 40,
      onTap: _onItemTapped,
      elevation: 5,
    );
  }
}

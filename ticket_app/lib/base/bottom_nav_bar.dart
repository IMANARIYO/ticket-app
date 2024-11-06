import 'package:fluentui_icons/fluentui_icons.dart'; // Import Fluent UI icons package
import 'package:flutter/material.dart';
import 'package:ticket_app/screens/home/home_screen.dart';
import 'package:ticket_app/screens/profile/profile_screen.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/search/ticket/ticket_Screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];
//change our index forBottomNavBar
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text("My tickets")),
      // ),
      body: appScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xff526400),
        showSelectedLabels: false,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_home_regular), // Fluent UI home icon
            activeIcon: Icon(FluentSystemIcons
                .ic_fluent_home_filled), // Active Fluent UI home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_search_regular), // Fluent UI search icon
            activeIcon: Icon(FluentSystemIcons
                .ic_fluent_search_filled), // Active Fluent UI search icon
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_ticket_regular), // Fluent UI ticket icon
            activeIcon: Icon(FluentSystemIcons
                .ic_fluent_ticket_filled), // Active Fluent UI ticket icon
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_person_regular), // Fluent UI person icon
            activeIcon: Icon(FluentSystemIcons
                .ic_fluent_person_filled), // Active Fluent UI person icon
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:meetings_cell/resources/auth_methods.dart';
import 'package:meetings_cell/screens/history_meetings_screen.dart';
import 'package:meetings_cell/screens/profile_screen.dart';

import '../utils/button.dart';
import '../utils/colors.dart';
import 'meeting_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });

  }
  List<Widget> pages =[
    MeetingScreen(),
    const HistoryMeetingScreen(),
    // const Text('Contacts'),
    const ProfileScreen(),
    

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meet & Chat "),
        centerTitle: true,
      ),


      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,


          items: [
            BottomNavigationBarItem(

                icon: Icon(Icons.comment_bank_outlined),
                label: "Meet"
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock),
                label: "Meetings"
            ),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.person_outline),
            //     label: "Contacts"
            // ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined),
                label: "Profile"
            ),
          ]),



      body: pages[_page],

    );
  }
}

import 'package:flutter/material.dart';

import '../utils/button.dart';
import '../utils/colors.dart';

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
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Contacts"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: "Settings"
            ),
          ]),



      body: Column(children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            gestureButton(
              onPressed: (){},
              icon: Icons.add,
              text: '   New Meeting  ',),

            gestureButton(
              onPressed: (){},
              icon: Icons.videocam,
              text: '  Join Meeting  ',),

            gestureButton(
              onPressed: (){},
              icon: Icons.edit_calendar_outlined,
              text: 'Schedule Meeting',)


          ],)
      ]),

    );
  }
}
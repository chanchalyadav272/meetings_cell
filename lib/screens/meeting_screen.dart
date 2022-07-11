import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meetings_cell/resources/jitsi_meet_methods.dart';

import '../utils/button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async{
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    
  }
  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');


  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gestureButton(
                onPressed: createNewMeeting,
                icon: Icons.add,
                text1: 'New',
                text2: 'Meeting',),

              gestureButton(
                onPressed: (){ joinMeeting(context);},
                icon: Icons.videocam,
                text1: 'Join',
                text2: 'Meeting',),

              gestureButton(
                onPressed: (){},
                icon: Icons.edit_calendar_outlined,
                text1: 'Schedule',
                text2: 'Meeting',),
              gestureButton(
                onPressed: (){},
                icon: Icons.arrow_upward,
                text1: 'Share',
                text2: 'Screen',)


            ],),
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Image(image: AssetImage('assets/images/img.png')),
          )


        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meetings_cell/resources/auth_methods.dart';
import 'package:meetings_cell/resources/jitsi_meet_methods.dart';
import 'package:meetings_cell/utils/colors.dart';

import '../utils/meeting_options.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({Key? key}) : super(key: key);

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  final AuthMethods _authMethods = AuthMethods();

  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMute = false;
  bool isVideoMute =false;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();


  }

  _joinMeeting(){
    _jitsiMeetMethods.createMeeting(roomName: meetingIdController.text, isAudioMuted: isAudioMute, isVideoMuted: isVideoMute,
    username: nameController.text);



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Join a Meeting',
        style: TextStyle(fontSize: 18),),
        centerTitle: true,

      ),

      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIdController,

              // maxLength: 8,
              inputFormatters: [
                LengthLimitingTextInputFormatter(8),
              ],
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: '',
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8)

              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8)

              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
              onTap: _joinMeeting,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const Padding(padding: EdgeInsets.all(8),
                  child: Text('Join Meeting',style: TextStyle(fontSize: 16),),
                ),
              ),
            ),

          SizedBox(height: 20,),
          MeetingOption(
            text: "Mute Audio ",
          isMute: isAudioMute,
          onChange: onAudioMute ,),
          MeetingOption(text: "Mute Video", isMute: isVideoMute, onChange: onVideoMute),
        ],
      ),
    );
  }

  onAudioMute(bool? val) {
    setState((){
      isAudioMute = val!;
    });
  }

  onVideoMute(bool? val) {
    setState((){
      isVideoMute = val!;
    });
  }
}

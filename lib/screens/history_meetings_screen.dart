import 'package:flutter/material.dart';
import 'package:meetings_cell/resources/firestore_methods.dart';
import 'package:intl/intl.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

        stream: FirestoreMethods().meetingHistory,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Container(color: Colors.black12,
                child: ListTile(
                  title: Text(
                    'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                  ),
                  subtitle: Text(
                    'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}
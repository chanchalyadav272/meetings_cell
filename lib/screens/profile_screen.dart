import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meetings_cell/resources/auth_methods.dart';

import '../utils/button.dart';


class ProfileScreen extends StatelessWidget {
  
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white70,
                
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Username",

                            style: TextStyle(
                                fontSize: 18
                            ),),
                          Text(": ",

                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(height: 40,
                      alignment: Alignment.centerLeft,
                      child: Text(AuthMethods().user.displayName!,

                        style: TextStyle(
                            fontSize: 18
                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white70,

                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email",

                            style: TextStyle(
                                fontSize: 18
                            ),),
                          Text(": ",

                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(height: 40,
                      alignment: Alignment.centerLeft,
                      child: Text(AuthMethods().user.email!,

                        style: TextStyle(
                            fontSize: 18
                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
        SizedBox(height: 30,),

        // SizedBox(height: MediaQuery.of(context).size.height*0.15,),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Image(image: AssetImage('assets/images/img.png')),
        ),
        CustomButton(text: 'Log Out', onPressed: () { AuthMethods().signOut();})
      ],


    );
  }
}

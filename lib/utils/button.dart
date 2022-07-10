import 'package:flutter/material.dart';

import 'colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;


  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: buttonColor),
          ),
        ),
      ),
    );
  }
}



class gestureButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text1;
  final String text2;

  const gestureButton({Key? key, required this.onPressed, required this.icon, required this.text1, required this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(children: [
        Container(
          height: 60,
          width: 60,
          child: Icon(icon, color: Colors.white, size: 30,),
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12,
                  offset: const Offset(0, 4),
                )
              ]
          ),

        ),
        const SizedBox(height: 10,),
        Container(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text1, style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),
            Text(text2, style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),
          ],
        ),width: 60, )

      ]),
    );
  }
}
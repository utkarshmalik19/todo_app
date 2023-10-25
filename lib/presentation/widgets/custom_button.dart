import 'package:flutter/material.dart';
import 'package:todo_app/utils/consts.dart';

//App constants included so keep in mind
class CustomButton extends StatelessWidget {
final Function()? onPressed;
  final String buttonText;
  const CustomButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      //For Rounded Border
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              //For giving border color
              side: BorderSide(color: Color(0xff003f24))),
      //For Specifying Size
          minimumSize: Size(300, 50),
          backgroundColor: AppConstants.primaryColor),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: Color(0xff003f24),
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }
}
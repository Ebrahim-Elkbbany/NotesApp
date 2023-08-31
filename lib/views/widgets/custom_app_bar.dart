import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.icon, required this.title, this.onPressed}) : super(key: key);
  final IconData icon;
  final String title;
 final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          title,
          style:const  TextStyle(fontSize: 28),
        ),
        CustomIcon(icon: icon ,onPressed: onPressed),
      ],
    );
  }
}



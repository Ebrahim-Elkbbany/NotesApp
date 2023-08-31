import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, required this.isLoading}) : super(key: key);
 final  void Function()? onTap;
 final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: kPrimaryColor,),
        child:  Center(
          child: isLoading ? const SizedBox(
            height: 24,
            width: 24,
            child:  CircularProgressIndicator(
              color: Colors.black,
            ),
          ):
          const Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
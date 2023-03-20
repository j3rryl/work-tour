
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget{
  final String imagePath;
  final Color imageColor;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color:Colors.white),
      borderRadius: BorderRadius.circular(16),
      color: imageColor),
      child: Image.asset(imagePath,
      height: 40)
    );

  }


}
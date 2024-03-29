import 'package:flutter/material.dart';

class ApproveBtn extends StatelessWidget{
final Function()? onTap;
  const ApproveBtn({
    super.key,
    required this.onTap

  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.green,
              borderRadius: BorderRadius.circular(8)),
          child:Center(
              child:Text("Approve",
                style: TextStyle(color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),)
          )
      )
    );

  }
}
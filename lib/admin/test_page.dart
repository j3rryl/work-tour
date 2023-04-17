import 'package:flutter/material.dart';

class TestPage extends StatefulWidget{
  TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {


  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: const Text("Test Page")

    );
  }
}
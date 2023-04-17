
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sm_work/admin/applications.dart';
import 'package:sm_work/admin/post_page.dart';
import 'package:sm_work/admin/posted_jobs.dart';
import 'package:sm_work/pages/search_page.dart';
import 'package:sm_work/pages/saved_page.dart';
import 'package:sm_work/pages/settings_page.dart';
import 'package:sm_work/pages/temp_page.dart';

class PageWrapperAdmin extends StatefulWidget{
  PageWrapperAdmin({super.key});

  @override
  State<PageWrapperAdmin> createState() => _PageWrapperAdminState();
}

class _PageWrapperAdminState extends State<PageWrapperAdmin> {
  final user = FirebaseAuth.instance.currentUser;
  //docs
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Posted(),
    Applications(),
    PostPage(),
    SettingTab()

  ];

  void signOut(){
    FirebaseAuth.instance.signOut();
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child:GNav(
                gap: 8,
                onTabChange: (index){
                  setState(() {
                    _selectedIndex=index;
                  });
                },
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.black,
                color:Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                tabs: const [
                  GButton(icon:Icons.home,
                      text:"Home"),
                  GButton(icon:Icons.inbox_outlined,
                      text:"Applications"),
                  GButton(icon:Icons.add,
                      text:"Post Job"),
                  GButton(icon:Icons.settings,
                      text:"Settings"),

                ]
            ),),)
    );
  }
}
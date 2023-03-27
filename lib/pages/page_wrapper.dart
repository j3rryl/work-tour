
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class PageWrapper extends StatefulWidget{
  PageWrapper({super.key});

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  final user = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
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
                  GButton(icon:Icons.favorite_border,
                      text:"Saved"),
                  GButton(icon:Icons.search,
                      text:"Search"),
                  GButton(icon:Icons.settings,
                      text:"Settings"),

                ]
            ),),)
    );
  }
}
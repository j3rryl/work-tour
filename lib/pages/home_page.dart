
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 300,
            // title: const Text("Work Tour"),
            // centerTitle: true,
            floating:false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.black54,
                // decoration: const BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Colors.black,
                //       Color(0x00434343)
                //     ],
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight
                //   )
                // ),
              ),
              title: const Text("Work Tour"),
              centerTitle: true,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: ClipRRect(
          //       borderRadius:BorderRadius.circular(20),
          //       child: Container(
          //         height: 400,
          //         color:Colors.deepPurple
          //       ),
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: ClipRRect(
          //       borderRadius:BorderRadius.circular(20),
          //       child: Container(
          //           height: 400,
          //           color:Colors.deepPurple
          //       ),
          //     ),
          //   ),
          // )
        ],
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
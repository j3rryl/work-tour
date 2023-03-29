import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius:BorderRadius.circular(20),
                child: Container(
                    height: 400,
                    color:Colors.deepPurple
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius:BorderRadius.circular(20),
                child: Container(
                    height: 400,
                    color:Colors.deepPurple
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
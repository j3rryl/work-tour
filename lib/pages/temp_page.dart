
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/get_job.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  List<String>docIDs=[];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection("jobs").get().then((snapshot)=>{
      snapshot.docs.forEach((element){
        docIDs.add(element.reference.id);
      }),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          children: [

        // slivers: [
        //   SliverAppBar(
        //     backgroundColor: Colors.black,
        //     expandedHeight: 300,
        //
        //
        //     // title: const Text("Work Tour"),
        //     // centerTitle: true,
        //     floating:false,
        //     pinned: true,
        //     flexibleSpace: FlexibleSpaceBar(
        //       background: Container(
        //         color: Colors.black54,
        //
        //         // decoration: const BoxDecoration(
        //         //   gradient: LinearGradient(
        //         //     colors: [
        //         //       Colors.black,
        //         //       Color(0x00434343)
        //         //     ],
        //         //     begin: Alignment.topLeft,
        //         //     end: Alignment.bottomRight
        //         //   )
        //         // ),
        //       ),
        //
        //       title: const Text("Work Tour"),
        //       centerTitle: true,
        //     ),
        //   ),
        //   // SliverToBoxAdapter(
        //   //   child: Padding(
        //   //     padding: const EdgeInsets.all(20.0),
        //   //     child: ClipRRect(
        //   //       borderRadius:BorderRadius.circular(20),
        //   //       child: Container(
        //   //           height: 400,
        //   //           color:Colors.deepPurple
        //   //       ),
        //   //     ),
        //   //   ),
        //   // ),
        //   // SliverToBoxAdapter(
        //   //   child: Padding(
        //   //     padding: const EdgeInsets.all(20.0),
        //   //     child: ClipRRect(
        //   //       borderRadius:BorderRadius.circular(20),
        //   //       child: Container(
        //   //           height: 400,
        //   //           color:Colors.deepPurple
        //   //       ),
        //   //     ),
        //   //   ),
        //   // )
        // ],
        Expanded(
          child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot){
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: GetJob(documentId:docIDs[index]),
                  );
                }
              );
            }
          )
        )
          ],
        )

      ),
    );
  }
}
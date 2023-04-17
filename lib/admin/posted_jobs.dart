
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sm_work/admin/view_a_job.dart';
import 'package:sm_work/models/get_icon.dart';
import 'package:sm_work/models/get_subtitle.dart';
import 'package:sm_work/pages/view_job.dart';

import '../models/get_job.dart';

class Posted extends StatefulWidget {
  const Posted({Key? key}) : super(key: key);

  @override
  State<Posted> createState() => _PostedState();
}

class _PostedState extends State<Posted> {
  List<String>docIDs=[];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection("jobs").get().then((snapshot)=>{
      snapshot.docs.forEach((element){
        docIDs.add(element.reference.id);
      }),
    });
  }
  void signOut(){
    FirebaseAuth.instance.signOut();
  }
  void navigateNextPage(BuildContext ctx,jobId){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return ViewAJobPage(jobId:jobId);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recruiter'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Show Snackbar',
            onPressed: () {
             signOut();
            },
          ),
        ],
      ),
      body: Center(
        child:Column(
          children: [
        Expanded(
          child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot){
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index){
                  return
                     Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    // padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                    title: GetJob(documentId:docIDs[index]),
                    subtitle: GetSub(documentId:docIDs[index]),

                    tileColor: Colors.white,

                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: GetIcon(documentId:docIDs[index]),
                      onTap: (){navigateNextPage(context,docIDs[index]);},


                    )
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
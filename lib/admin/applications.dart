
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sm_work/admin/view_applicant.dart';
import 'package:sm_work/models/get_date.dart';
import 'package:sm_work/models/get_icon.dart';
import 'package:sm_work/models/get_profile.dart';
import 'package:sm_work/models/get_subtitle.dart';
import 'package:sm_work/models/get_user.dart';
import 'package:sm_work/pages/view_job.dart';

import '../models/get_job.dart';

class Applications extends StatefulWidget {
  const Applications({Key? key}) : super(key: key);

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  List<String>docIDs=[];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection("applications").get().then((snapshot)=>{
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
      return ViewApplicantPage(jobId:jobId);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Tour'),
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
                                      title: GetUser(documentId:docIDs[index]),
                                      subtitle: GetDate(documentId:docIDs[index]),

                                      tileColor: Colors.white,

                                      trailing: Icon(Icons.arrow_forward_ios),
                                      leading: GetProfile(documentId:docIDs[index]),
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
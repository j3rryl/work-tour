
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sm_work/models/get_icon.dart';
import 'package:sm_work/models/get_subtitle.dart';
import 'package:sm_work/pages/view_job.dart';

import '../models/get_job.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
      return ViewJobPage(jobId:jobId);
    }));
  }

String searchValue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            title: Text('Nairobi'),
            onSearch: (value) => setState(() => searchValue = value)
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
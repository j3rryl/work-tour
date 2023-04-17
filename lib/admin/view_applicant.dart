import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sm_work/components/approve.dart';
import 'package:sm_work/components/decline.dart';
import 'package:sm_work/models/view_job_applicant.dart';

class ViewApplicantPage extends StatefulWidget{
  ViewApplicantPage ({super.key,this.jobId}) ;

  final String?jobId;

  @override
  State<ViewApplicantPage> createState() => _ViewApplicantPageState();
}

class _ViewApplicantPageState extends State<ViewApplicantPage> {
  final user = FirebaseAuth.instance.currentUser;

  void applyJob(String fName, String lName, String id) async {
    //loading
    showDialog(context: context, builder: (context){
      return const Center(
          child: CircularProgressIndicator()
      );
    });
  }

  Future addApplicationDetails()async{
    try{
      await FirebaseFirestore.instance.collection('applications').add({
      //   'firstName':fName,
      //   'lastName':lName,
        'jobId':widget.jobId,
        'userId':user!.uid
      //
      });
      showDialog(context: context, builder: (context){
        return const AlertDialog(title:Text('Application Successful'));
      });

    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
        backgroundColor:Colors.grey[300],
        body:
        SafeArea(
            child: SingleChildScrollView(
                child:Center(
                    child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height:30),

                          const Text('View Applicant',
                            style: TextStyle(
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            ), textAlign: TextAlign.left,),
                          const SizedBox(height:25),
                          Card(
                            elevation: 0,
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            child: Column(
                              children: [

                                ViewApplicant(documentId: '${widget.jobId}'),
                                Row(
                                  children: [
                                    ApproveBtn(onTap:(){}),
                                    SizedBox(width: 25,),
                                    DeclineBtn(onTap:(){})

                                  ],
                                ),
                                SizedBox(height: 25,),


                                //     const SizedBox(
                            // width: 200,
                            //   height: 100,
                            //     ),
                              ],
                            ),

                            ),
                          const SizedBox(height: 25,),



                        ],
                )
            )
        )
    )

    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sm_work/components/apply_job.dart';
// import 'package:lottie/lottie.dart';
import 'package:sm_work/components/my_button.dart';
import 'package:sm_work/components/my_textfield.dart';
import 'package:sm_work/components/square_tile.dart';
import 'package:sm_work/models/view_job_item.dart';

class ViewAJobPage extends StatefulWidget{
  ViewAJobPage ({super.key,this.jobId}) ;

  final String?jobId;

  @override
  State<ViewAJobPage> createState() => _ViewAJobPageState();
}

class _ViewAJobPageState extends State<ViewAJobPage> {
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

                          const Text('View Job ',
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

                                ViewJobItem(documentId: '${widget.jobId}'),
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
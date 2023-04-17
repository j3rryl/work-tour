import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sm_work/components/apply_job.dart';
// import 'package:lottie/lottie.dart';
import 'package:sm_work/components/my_button.dart';
import 'package:sm_work/components/my_textfield.dart';
import 'package:sm_work/components/square_tile.dart';
import 'package:sm_work/models/view_job_item.dart';

class ViewJobPage extends StatefulWidget{
  ViewJobPage ({super.key,this.jobId}) ;

  final String?jobId;

  @override
  State<ViewJobPage> createState() => _ViewJobPageState();
}

class _ViewJobPageState extends State<ViewJobPage> {

  final user = FirebaseAuth.instance.currentUser;
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final motivationController = TextEditingController();
  final salaryController = TextEditingController();

  void applyJob(String fName, String lName, String id) async {
    //loading
    showDialog(context: context, builder: (context){
      return const Center(
          child: CircularProgressIndicator()
      );
    });
  }

  Future addApplicationDetails()async{
    showDialog(context: context, builder: (context){
      return const Center(
          child: CircularProgressIndicator()
      );
    });
    try{
      dynamic currentTime = DateFormat.jm().format(DateTime.now());

      await FirebaseFirestore.instance.collection('applications').add({
      //   'firstName':fName,
      //   'lastName':lName,
        'jobId':widget.jobId,
        'userId':user!.uid,
        'posted_at':currentTime,
        'name':nameController.text.trim(),
        'idCard':idController.text.trim(),
        'motivation':motivationController.text.trim(),
        'expectedSalary':salaryController.text.trim(),
        'displayPhoto':user!.photoURL,
        'email':user!.email,


        //
      });
      Navigator.pop(context);
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

                          const Text('View Job',
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

                                const SizedBox(height:1),
                                const Text('Apply Here',
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,

                                  ), textAlign: TextAlign.left,),
                                const SizedBox(height:20),

                                MyTextField(controller: nameController,
                                  hintText: "Name",
                                  obscureText: false,),
                                const SizedBox(height:10),

                                MyTextField(controller: idController,
                                  hintText: "National ID/Passport",
                                  obscureText: false,),
                                const SizedBox(height:10),

                                MyTextField(controller: motivationController,
                                  hintText: "Motivation",
                                  obscureText: false,),
                                const SizedBox(height:10),

                                MyTextField(controller: salaryController,
                                  hintText: "Expected Salary",
                                  obscureText: false,),
                                const SizedBox(height:20),


                            //     const SizedBox(
                            // width: 200,
                            //   height: 100,
                            //     ),
                              ],
                            ),
                            ),


                          const SizedBox(height: 25,),
                          ApplyJobButton(onTap: addApplicationDetails),
                          const SizedBox(height: 50,),

                        ],
                )
            )
        )
    )

    );
  }
}
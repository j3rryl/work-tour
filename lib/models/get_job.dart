import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetJob extends StatelessWidget{
  final String documentId;
  GetJob({required this.documentId});
  @override
  Widget build(BuildContext context){
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
    return FutureBuilder<DocumentSnapshot>(
        future: jobs.doc(documentId).get(),
        builder: ((context, snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        Map<String, dynamic>data=snapshot.data!.data() as Map<String,dynamic>;
        return Text('Name: ${data['name']}');
      }
      return Text('loading...');
    }));

  }
}
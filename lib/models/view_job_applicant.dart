import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewApplicant extends StatelessWidget{
  final String documentId;
  ViewApplicant({required this.documentId});

  @override
  Widget build(BuildContext context){
    CollectionReference jobs = FirebaseFirestore.instance.collection('applications');
    return FutureBuilder<DocumentSnapshot>(
        future: jobs.doc(documentId).get(),
        builder: ((context, snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        Map<String, dynamic>data=snapshot.data!.data() as Map<String,dynamic>;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image(
                image: NetworkImage('${data['displayPhoto']}'),
                width: 200,
                height: 200,
              ),
              SizedBox(height: 12),
            Align(
            alignment: Alignment.centerLeft,
              child: Row(
                  children:[ Icon(Icons.account_circle_outlined),SizedBox(width: 12), Text('${data['name']}')]
              )
            ),

              SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
              child: Row(
                  children:[ Icon(Icons.email_outlined),SizedBox(width: 12), Text('${data['email']}'),]
              )
          ),
              SizedBox(height: 12),
          Align(
          alignment: Alignment.centerLeft,
              child: Row(
               children:[ Icon(Icons.wallet_giftcard),SizedBox(width: 12), Text('${data['motivation']}')]

              )
          ),
              SizedBox(height: 12),
          Align(
          alignment: Alignment.centerLeft,
              child: Row(
                  children:[ Icon(Icons.money_outlined),SizedBox(width: 12), Text('${data['expectedSalary']}')]
              )
          ),
              SizedBox(height: 12),
            ],
          ),
        );
      }
      return Text('loading...');
    }));

  }
}
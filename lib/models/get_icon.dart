import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetIcon extends StatelessWidget{
  final String documentId;
  GetIcon({required this.documentId});
  @override
  Widget build(BuildContext context){
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
    return FutureBuilder<DocumentSnapshot>(
        future: jobs.doc(documentId).get(),
        builder: ((context, snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        Map<String, dynamic>data=snapshot.data!.data() as Map<String,dynamic>;
        return Image(
          image: NetworkImage('${data['image']}'),
          width: 30,
          height: 30,
        );
      }
      return Image(
        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        width: 30,
        height: 30,
      );
    }));

  }
}
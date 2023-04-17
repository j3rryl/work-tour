import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewJobItem extends StatelessWidget{
  final String documentId;
  ViewJobItem({required this.documentId});

  @override
  Widget build(BuildContext context){
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
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
                image: NetworkImage('${data['image']}'),
                width: 200,
                height: 200,
              ),
              SizedBox(height: 12),
            Align(
            alignment: Alignment.centerLeft,
              child: Row(
                  children:[ Icon(Icons.work_history),SizedBox(width: 12), Text('${data['name']}')]
              )
            ),

              SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
              child: Row(
                  children:[ Icon(Icons.file_copy_outlined),SizedBox(width: 12), Text('${data['description']}'),]
              )
          ),
              SizedBox(height: 12),
          Align(
          alignment: Alignment.centerLeft,
              child: Row(
               children:[ Icon(Icons.location_city_outlined),SizedBox(width: 12), Text('${data['location']}')]

              )
          ),
              SizedBox(height: 12),
          Align(
          alignment: Alignment.centerLeft,
              child: Row(
                  children:[ Icon(Icons.person_2_outlined),SizedBox(width: 12), Text('${data['posted_by']}')]
              )
          ),
              SizedBox(height: 12),
              Align(
                    alignment: Alignment.centerRight,
                      child: Row(
                          children:[
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_outlined,color: Colors.red,))
                             ]
                      )

              )
            ],
          ),
        );
      }
      return Text('loading...');
    }));

  }
}
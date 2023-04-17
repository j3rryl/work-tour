import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
import 'package:sm_work/components/my_button.dart';
import 'package:sm_work/components/my_textfield.dart';
import 'package:sm_work/components/post_job.dart';
import 'package:sm_work/components/register_button.dart';
import 'package:sm_work/components/square_tile.dart';

class PostPage extends StatefulWidget{

  const PostPage({Key? key}) : super(key: key);


  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final user = FirebaseAuth.instance.currentUser;

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final locationController = TextEditingController();
  final salaryController = TextEditingController();
  final deadlineController = TextEditingController();






  String selectFile = '';
  String imageUrl="";
  late XFile file;
  Future signUp()async{

    try{
      showDialog(context: context, builder: (context){
        return const Center(
            child: CircularProgressIndicator()
        );
      });
      dynamic currentTime = DateFormat.jm().format(DateTime.now());


      firebase_storage.UploadTask uploadTask;
      firebase_storage.Reference ref= firebase_storage.FirebaseStorage.instance.ref().child('images').child('/'+file.name);
      uploadTask = ref.putFile(File(file.path));
      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('jobs').add({
        'name':nameController.text.trim(),
        'description':descController.text.trim(),
        'location':locationController.text.trim(),
        'salary':salaryController.text.trim(),
        'deadline':deadlineController.text.trim(),
        'image':imageUrl,
        'posted_by':user!.email,
        'posted_at': currentTime,
        'uid_posted_by':user!.uid
      });
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return const AlertDialog(title:Text('Post Successful'));
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
                          const Text('Post Job',
                            style: TextStyle(
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            ), textAlign: TextAlign.left,),

                          const SizedBox(height:25),
                          MyTextField(controller: nameController,
                            hintText: "Job Name",
                            obscureText: false,),
                          const SizedBox(height:10),

                          MyTextField(controller: descController,
                            hintText: "Job Description",
                            obscureText: false,),
                          const SizedBox(height:10),

                          MyTextField(controller: locationController,
                            hintText: "Location",
                            obscureText: false,),
                          const SizedBox(height:10),

                          MyTextField(controller: salaryController,
                            hintText: "Salary",
                            obscureText: false,),
                          const SizedBox(height:10),

                          MyTextField(controller: deadlineController,
                            hintText: "Application Deadline",
                            obscureText: false,),
                          const SizedBox(height:10),

                          IconButton(onPressed:() async{
                            ImagePicker imagePicker = ImagePicker();
                            file = (await imagePicker.pickImage(source: ImageSource.gallery))!;
                            setState(() {
                              selectFile=file.path;

                            });
                            print('nameimage: ${file?.path}');


                          } , icon: const Icon(Icons.camera_alt,size: 30,)),
                           Container(
                            child: selectFile.isNotEmpty?
                                Image.file(File(file.path),
                                fit: BoxFit.fill,height: 200,)
                                :null,
                          ),
                          const SizedBox(height: 25,),
                          PostButton(onTap: signUp),
                          const SizedBox(height:50),

                        ]

                    )
                )
            )
        )

    );
  }
}
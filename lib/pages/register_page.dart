import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
import 'package:sm_work/components/my_button.dart';
import 'package:sm_work/components/my_textfield.dart';
import 'package:sm_work/components/register_button.dart';
import 'package:sm_work/components/square_tile.dart';

class RegisterPage extends StatefulWidget{
  final VoidCallback showingLoginPage;

  RegisterPage({Key?key,required this.showingLoginPage}):super(key:key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  Future addUserDetails()async{


  }

  String _value="";
  String selectFile = '';
  String imageUrl="";
  late XFile file;
  Future signUp()async{
    showDialog(context: context, builder: (context){
      return const Center(
          child: CircularProgressIndicator()
      );
    });
    final user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim())).user;
    try{
      firebase_storage.UploadTask uploadTask;
      firebase_storage.Reference ref= firebase_storage.FirebaseStorage.instance.ref().child('images').child('/'+file.name);
      uploadTask = ref.putFile(File(file.path));
      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
      await user!.updatePhotoURL(imageUrl);
      await user!.updateDisplayName(fNameController.text.trim());

      Navigator.pop(context);

      await FirebaseFirestore.instance.collection('users').add({
        'firstName':fNameController.text.trim(),
        'lastName':lNameController.text.trim(),
        'email':emailController.text.trim(),
        'password':passwordController.text.trim(),
        'userType':_value,
        'displayName':fNameController.text.trim(),
        'image':imageUrl,
        'uid':user!.uid
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
                          const Text('Register',
                            style: TextStyle(
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            ), textAlign: TextAlign.left,),

                          const SizedBox(height:25),
                          MyTextField(controller: fNameController,
                            hintText: "First Name",
                            obscureText: false,),
                          const SizedBox(height:10),

                          MyTextField(controller: lNameController,
                            hintText: "Last Name",
                            obscureText: false,),
                          const SizedBox(height:10),

                          MyTextField(controller: emailController,
                            hintText: "Email",
                            obscureText: false,),
                          const SizedBox(height:10),

                          MyTextField(controller: passwordController,
                            hintText: "Password",
                            obscureText: true,),
                          const SizedBox(height:10),

                          Row(
                            children: [
                              Radio(
                                value: "Seeker",
                                groupValue: _value,
                                onChanged: (value){ setState(() {
                                  print(value);

                                  _value=value.toString();
                                });}
                              ),
                              SizedBox(width: 10,),
                              Text("Seeker?")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "Recruiter",
                                  groupValue: _value,
                                  onChanged: (value){
                                    print(value);
                                    _value=value.toString();

                                  }
                              ),
                              SizedBox(width: 10,),
                              Text("Recruiter")
                            ],
                          ),
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
                          RegisterButton(onTap: signUp),
                          const SizedBox(height: 50,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: [
                                Expanded(child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                                ),
                                Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Or continue with',
                                      style: TextStyle(color: Colors.grey[700]),)),

                                Expanded(child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                                ),
                              ],
                            ),),
                          const SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SquareTile(imagePath: 'assets/images/google.png',imageColor: Colors.grey[200]!),
                              const SizedBox(width: 10),
                              const SquareTile(imagePath:'assets/images/github.png',imageColor: Colors.black,),
                            ],
                          ),
                          const SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already a member?',
                                style: TextStyle(
                                    color:Colors.grey[700]
                                ),),
                              const SizedBox(width: 4,),
                              GestureDetector(
                                onTap: widget.showingLoginPage,
                                child: const Text('Login Now',
                                  style: TextStyle(
                                      color:Colors.blue, fontWeight: FontWeight.bold
                                  ),),
                              )
                            ],),
                          const SizedBox(height:50),

                        ]

                    )
                )
            )
        )

    );
  }
}
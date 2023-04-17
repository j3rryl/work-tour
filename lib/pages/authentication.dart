
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sm_work/admin/page_wrapper_admin.dart';
import 'package:sm_work/pages/login_page.dart';
import 'package:sm_work/pages/page_wrapper.dart';
import 'package:sm_work/pages/register_page.dart';

class AuthenticationPage extends StatefulWidget{
  const AuthenticationPage({Key?key}):super(key:key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool showLoginPage=true;
  String userType="";
  void toggleScreens(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  getUser(id)async{
  await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if(id==element.get("uid")){
          setState(() {
            userType=element.get("userType");
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user logged in
          if(snapshot.hasData){
            getUser(snapshot.data!.uid);
          if(userType=="Recruiter"){
            return PageWrapperAdmin();

          } else {
return PageWrapper();
          }
          } else {
            if(showLoginPage){
              return LoginPage(showingRegisterPage: toggleScreens);
            }
            return RegisterPage(showingLoginPage: toggleScreens);
          }
        }
      ),
    );
  }
}
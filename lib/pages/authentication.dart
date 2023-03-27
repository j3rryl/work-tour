
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sm_work/pages/login_page.dart';
import 'package:sm_work/pages/page_wrapper.dart';

class AuthenticationPage extends StatelessWidget{
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user logged in
          if(snapshot.hasData){
            return PageWrapper();
          } else {
            return LoginPage();
          }
        }
      ),
    );
  }
}
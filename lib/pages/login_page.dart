import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sm_work/components/my_button.dart';
import 'package:sm_work/components/my_textfield.dart';
import 'package:sm_work/components/square_tile.dart';

class LoginPage extends StatefulWidget{

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signIn() async {

    //loading
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator()
      );
    });
    //sign In
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);

      if(e.code=='user-not-found'){
        wrongEmail();

      } else if(e.code=='wrong-password'){
        wrongPassword();
      }
    }
  }
  void wrongEmail(){
    showDialog(context: context, builder: (context){
    return const AlertDialog(title:Text('Incorrect email'));
    });
  }

  void wrongPassword(){
    showDialog(context: context, builder: (context){
      return const AlertDialog(title:Text('Incorrect password'));
    });
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
                  Container(
                    height: 200,
                    width: 400,
                    child: Lottie.asset('assets/animations/animated_lock.json'),

                  ),
                  const SizedBox(height:30),
                  Text('Login',
                    style: TextStyle(
                        color:Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ), textAlign: TextAlign.left,),
                  const SizedBox(height:25),
                  MyTextField(controller: emailController,
                  hintText: "Email",
                  obscureText: false,),
                  const SizedBox(height:10),
                  MyTextField(controller: passwordController,
                    hintText: "Password",
                    obscureText: true,),
                  const SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password? ',
                            style:TextStyle(color: Colors.grey[600]))
                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),
                  MyButton(onTap: signIn,),
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
                    SquareTile(imagePath:'assets/images/github.png',imageColor: Colors.black,),
                  ],
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Not a member?',
                    style: TextStyle(
                      color:Colors.grey[700]
                    ),),
                    const SizedBox(width: 4,),
                    Text('Register Now',
                    style: TextStyle(
                      color:Colors.blue, fontWeight: FontWeight.bold
                    ),)
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
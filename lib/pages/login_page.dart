import 'package:flutter/material.dart';
import 'package:sm_work/components/my_button.dart';
import 'package:sm_work/components/my_textfield.dart';

class LoginPage extends StatelessWidget{

  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn(){}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.grey[300],
      body:SafeArea(
        child:Center(
            child:Column(
                children: [
                  const SizedBox(height:50),
                  const Icon(Icons.lock,
                    size:100,
                  ),
                  const SizedBox(height:50),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize:16
                    ),
                  ),
                  const SizedBox(height:25),
                  MyTextField(controller: usernameController,
                  hintText: "Username",
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
                  Row(children: [
                    Image.asset('lib/images/google.png',height: 40,),
                    const SizedBox(width: 10),
                    Image.asset('lib/images/apple.png',height: 40,),
                  ],)



                ]

            )
        )
      )

    );
  }
}
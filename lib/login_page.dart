// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:translate_application/home_page.dart';
import 'package:translate_application/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
          ),
          Container(
            
            child: Column(
              children: [
                const Text(
                  'Sign in to your account',
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                   ),
                   ),
                const SizedBox(height: 50),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email ID',
                    prefixIcon: Icon(Icons.mail, color:Colors.black)
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.security, color: Colors.black),

                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    onPressed: () {


                    },
                    fillColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),

                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child:  RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap=(){

                              Get.to(()=>const SignUp());
                            },
                            text: " Create",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                        ],
                  ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
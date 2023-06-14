import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:translate_application/home_page.dart';
import 'package:get/get.dart';
import 'package:translate_application/test.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    return Scaffold(
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
                  'Sign up to create your account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 50),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email ID',
                      prefixIcon: Icon(Icons.mail, color:Colors.black)
                  ),
                ),
                const SizedBox(height: 25),
                const TextField(
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
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
                        print("Created User");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                      }).onError((error, stackTrace) {print('error');});

                    },
                    fillColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),

                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),

              ],
            ),
          )
        ],
      ),
    );
  }
}




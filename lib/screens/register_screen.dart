// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitpad/components/our_button.dart';
import 'package:fitpad/constants.dart';
import 'package:fitpad/screens/login_screen.dart';
import 'package:fitpad/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late String email;
  bool visiblePassword = true;
  late String password;
  late String name;
  late String number;
  bool showSpinner = false;
  Future signUp() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final signUpUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      if (signUpUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      }
      setState(() {
        showSpinner = false;
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: blueColor,
          elevation: 5,
          duration: const Duration(seconds: 3),
          content: Text(
            e.message.toString(),
            style: kTextStyleLarge,
          ),
        ),
      );
      setState(() {
        showSpinner = false;
      });
    }
  }

  late DatabaseReference _databaseReference;

  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.ref().child("Information");
    super.initState();
  }

  @override
  void dispose() {
    Map<String, String> information = {
      'UserName': name,
      'Number': number,
    };
    _databaseReference
        .child(FirebaseAuth.instance.currentUser!.uid)
        .set(information);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: blueColor,
        ),
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text("Create new account", style: kTextStyleHeaders),
                  Text(
                    "Please fill the form to continue",
                    style: kTextStyleSmall.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Username",
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          )),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is required";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Email",
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                          )),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email is required";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Phone Number",
                          prefixIcon: const Icon(
                            Icons.numbers,
                            color: Colors.white,
                          )),
                      onChanged: (value) {
                        setState(() {
                          number = value;
                        });
                      },
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value != null && value.length < 10) {
                          return "phone number must be of 10 digit";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: TextFormField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (visiblePassword == true) {
                                  visiblePassword = false;
                                } else {
                                  visiblePassword = true;
                                }
                              });
                            },
                            icon: visiblePassword == true
                                ? const Icon(CupertinoIcons.eye_fill,
                                    color: Colors.white)
                                : const Icon(CupertinoIcons.eye_slash_fill,
                                    color: Colors.white),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  mainButton(
                    "Sign Up",
                    () {
                      final validateForm = formKey.currentState!.validate();
                      if (validateForm) {
                        signUp();
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?", style: kTextStyleSmall),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text(
                            "Sign In",
                            style: kTextStyleSmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: orangeColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

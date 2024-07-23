// ignore_for_file: prefer_const_constructors

import 'package:fake_store/authentication/data/models/user_model.dart';
import 'package:fake_store/authentication/data/repositeries/auth_repositeries.dart';
import 'package:fake_store/authentication/presentation/screens/signup.dart';
import 'package:fake_store/authentication/presentation/widgets/text_form_field.dart';
import 'package:fake_store/product/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool matchPass = true;
 
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         foregroundColor: Colors.white60,
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              textAlign: TextAlign.center,
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
          
          ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuaFbSBB0jlzb2y86natz3_I5G9mob-Gvjg65QmHG8LZ9Dzd11352IaBGB7Fm5i-C-5qs&usqp=CAU'),
              ),
               AppTextFormField(
                    prefix: Icon(Icons.email),
                    controller: emailcontroller,
                    Text: ' Email',
                    validate: (p0) {
                      if (p0!.contains('@')) {
                        return null;
                      } else {
                        return "This feild must contains @";
                      }
                    },
                  ),
              AppTextFormField(
                controller: passwordcontroller,
                Text: 'Password',
                isPass: true,
                validate: (p0) {
                  if ((p0!).length >= 6 && matchPass == true) {
                    return null;
                  } else {
                    return ("Wrong password");
                  }
                },
              ),
            ElevatedButton(
                      onPressed: () {
                        // _formKey.currentState!.validate();
                        if (_formKey.currentState!.validate()) {
                          var user = UserModel(
                              user_neme: namecontroller.text,
                              email: emailcontroller.text,
                              phone: phonecontroller.text);
                          if (AuthRepositeries.checkData(user)) {
                            var realUser= AuthRepositeries.getUserData();
                             Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductScreen(
                                userData: realUser!,
                              );
                            }));
                            
                          } else {
                            
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Dosen't Have Account"),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }
                      },
                      child: Text('Login ')),
                      TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Signup();
                  }));
                },
                child: Text("Don't Have account")),
            ],
          ),
        ),
      ),
    );
  }
}
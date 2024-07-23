import 'package:fake_store/authentication/data/models/user_model.dart';
import 'package:fake_store/authentication/data/repositeries/auth_repositeries.dart';
import 'package:fake_store/authentication/presentation/screens/login_screen.dart';
import 'package:fake_store/authentication/presentation/widgets/text_form_field.dart';
import 'package:fake_store/product/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  List<String> gender = ["Male", "Female"];
  late String selectedGender = gender[0];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  AppTextFormField(
                    prefix: Icon(Icons.person),
                    controller: namecontroller,
                    Text: 'User Name',
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: IntlPhoneField(
                      controller: phonecontroller,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  AppTextFormField(
                    prefix: Icon(Icons.lock),
                    controller: passwordcontroller,
                    isPass: true,
                    Text: 'password',
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: Text(
                              '${gender[0]}'), // Display the title for option 1
                          value:
                              gender[0], // Assign a value of 1 to this option
                          groupValue:
                              selectedGender, // Use _selectedValue to track the selected option
                          onChanged: (value) {
                            setState(() {
                              selectedGender =
                                  value!; // Update _selectedValue when option 1 is selected
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: Text(
                              '${gender[1]}'), // Display the title for option 1
                          value:
                              gender[1], // Assign a value of 1 to this option
                          groupValue:
                              selectedGender, // Use _selectedValue to track the selected option
                          onChanged: (value) {
                            setState(() {
                              selectedGender =
                                  value!; // Update _selectedValue when option 1 is selected
                            });
                          },
                        ),
                      ),
                    ],
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Email Already Exist'),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            AuthRepositeries.saveUserData(user);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductScreen(
                                userData: user,
                              );
                            }));
                          }
                        }
                      },
                      child: Text('sign Up')),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text('you have account')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextFormField extends StatefulWidget {
  Widget? prefix;
  String? Function(String?)? validate;
  bool isPass;
  // ignore: non_constant_identifier_names
  final String Text ;
  TextEditingController? controller;
    // ignore: non_constant_identifier_names
   AppTextFormField({super.key , required this.Text, this.validate , this.isPass=false ,this.controller,
   this.prefix}){
 validate ??=(value){
  if(value==null || value!.isEmpty){
    return "This feild can't be Empty";
  }else{
    return null;
  }
 };
   }

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: TextFormField(
        obscureText: widget.isPass,
        controller: widget.controller,
                      validator: widget.validate,
                      decoration: InputDecoration(
                        prefixIcon:widget.prefix ,
                        suffixIcon: widget.isPass ? Icon(Icons.visibility_off): null,
                         border: OutlineInputBorder(),
                        hintText: widget.Text
                      ),
                    ),
    );
  }
}
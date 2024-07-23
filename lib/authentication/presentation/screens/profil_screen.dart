// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:fake_store/authentication/data/models/user_model.dart';
import 'package:fake_store/authentication/data/repositeries/auth_repositeries.dart';
import 'package:fake_store/authentication/presentation/screens/login_screen.dart';
import 'package:fake_store/authentication/presentation/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilScreen extends StatefulWidget {
  final UserModel userData;
  const ProfilScreen({super.key, required this.userData});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
   File? _backgroundImageFile;
   void backgroundImage() async {
        final ImagePicker picker = ImagePicker();
        final XFile? img = await picker.pickImage(
          source: ImageSource.gallery, // alternatively, use ImageSource.gallery
          maxWidth: 400,
        );
        if (img == null) return;
        setState(() {
          AuthRepositeries.saveImageBackground(img.path);
          _backgroundImageFile = File(img.path); // convert it to a Dart:io file
        });
      }
      checkImageBackground (){
  String? imgBackground = AuthRepositeries.getImageBackground();
  if (imgBackground == null) {
    return;
  }
  setState(() {
    _backgroundImageFile = File(imgBackground);
  });
}
      ////////////
   File? _imgFile;
   void takeSnapshot() async {
        final ImagePicker picker = ImagePicker();
        final XFile? img = await picker.pickImage(
          source: ImageSource.gallery, // alternatively, use ImageSource.gallery
          maxWidth: 400,
        );
        if (img == null) return;
        setState(() {
          AuthRepositeries.saveImageProfil(img.path);
          _imgFile = File(img.path); // convert it to a Dart:io file
        });
      }
checkImage (){
  String? img = AuthRepositeries.getImageProfil();
  if (img == null) {
    return;
  }
  setState(() {
    _imgFile = File(img);
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkImage();
    checkImageBackground ();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white60,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }), (Route<dynamic> route) => false);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white54,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: backgroundImage,
                  child:(_backgroundImageFile == null)
                       ?
                Image.network(
                  
                  height: 250,
                  'https://t4.ftcdn.net/jpg/06/91/19/21/360_F_691192190_4M1HgpRLj2tkbdonci9wBEIfjTYXlN5y.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ) :Image.file(_backgroundImageFile!,height: 250, fit: BoxFit.cover,
                  width: double.infinity,)
                ),
                
               
                Positioned(
                    bottom: -70,
                    child: CircleAvatar(
                      child: InkWell(
                        onTap: takeSnapshot,
                      ),
                      radius: 75,
                      backgroundImage: (_imgFile == null)
                       ? NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuaFbSBB0jlzb2y86natz3_I5G9mob-Gvjg65QmHG8LZ9Dzd11352IaBGB7Fm5i-C-5qs&usqp=CAU')
                           : FileImage(_imgFile!)
                    ))
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              widget.userData.user_neme,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            Text(
              widget.userData.email,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              widget.userData.phone,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthRepositeries.deletUserData();
                 Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return Signup();
                }), (Route<dynamic> route) => false);
                },
                child: Text('Delet Account'))
          ],
        ),
      ),
    );
  }
}

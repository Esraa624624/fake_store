import 'package:fake_store/authentication/data/models/user_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositeries {
 static late  final  SharedPreferences  sp ;

  static init ()async{
     sp = await SharedPreferences.getInstance();
  }
  
  static saveUserData(UserModel userData){
   sp.setString('userName', userData.user_neme);
   sp.setString('email', userData.email);
   sp.setString('phone', userData.phone);
  }

 static bool checkData (UserModel userData){
  String? emailData= sp.getString('email');
  if(emailData==userData.email){
    return true;
  }else{
    return false;
  }

 }

 static UserModel? getUserData (){
  if(sp.getString('email')==null){
  return null ;
  }
   return UserModel(user_neme: sp.getString('userName')!, email: sp.getString('email')!, phone: sp.getString('phone')!) ;

 }

 static  deletUserData (){
  sp.clear();

 }

 static saveImageProfil(String img){
  sp.setString('imgProfil', img);
 }

 static String? getImageProfil(){
 
  String? Image= sp.getString('imgProfil');
  return Image;
 }

 static saveImageBackground(String Background){
  sp.setString('imgBackground', Background);
 }

 static String? getImageBackground(){
 
  String? Background= sp.getString('imgBackground');
  return Background;
 }
}
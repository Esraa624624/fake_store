// import 'package:easy_localization/easy_localization.dart';
// import 'package:fake_store/authentication/data/models/user_model.dart';
// import 'package:fake_store/authentication/data/repositeries/auth_repositeries.dart';
// import 'package:fake_store/authentication/presentation/screens/profil_screen.dart';
// import 'package:fake_store/authentication/presentation/screens/signup.dart';


// import 'package:fake_store/product/domain/product_cubit/products_cubit.dart';
// import 'package:fake_store/product/presentation/screens/product_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async {
 
//   WidgetsFlutterBinding.ensureInitialized();
//    AuthRepositeries.init();
//   await EasyLocalization.ensureInitialized();
//   var user =AuthRepositeries.getUserData();
//   //runApp(const MainApp());
//   runApp(EasyLocalization(
//     supportedLocales: const [Locale('en'), Locale('ar')],
//     path: 'assets/translations',
//     startLocale: Locale('en'),
//     child: MainApp(user:user! ),
//   ));

// }

// class MainApp extends StatelessWidget {
//   UserModel? user ;
//    MainApp({super.key, required this.user});

//   @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   ProductsRepositeries.getAllProducts();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductsCubit()..fatchData(),
//       child: MaterialApp(
//           localizationsDelegates: context.localizationDelegates,
//           supportedLocales: context.supportedLocales,
//           locale: context.locale,
//        // home: Signup()
//        home: user ==null ? Signup() : ProductScreen(userData: user!) ,
//         //  home: ProfilScreen(userData: UserModel(user_neme: "user_neme", email: 'email', phone: 'phone'),),
//           ),
//     );
//   }
// }

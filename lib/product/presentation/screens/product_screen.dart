import 'package:easy_localization/easy_localization.dart';
import 'package:fake_store/authentication/data/models/user_model.dart';
import 'package:fake_store/authentication/presentation/screens/profil_screen.dart';
import 'package:fake_store/product/domain/product_cubit/products_cubit.dart';
import 'package:fake_store/product/domain/product_cubit/products_states.dart';
import 'package:fake_store/product/presentation/widgets/product_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  final UserModel userData;

  ProductScreen({super.key, required this.userData});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   if (context.locale.languageCode == 'en') {
      //     setState(() {
      //       context.setLocale(Locale('ar'));
      //     });
      //   } else {
      //     setState(() {
      //       context.setLocale(Locale('en'));
      //     });
      //   }
      // }),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(Locale('ar'));
                  } else {
                    context.setLocale(Locale('en'));
                  }
                });
              },
              icon: Icon(Icons.language)),
              Text(context.locale.languageCode == 'en'?"EN":"AR"),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilScreen(userData: widget.userData);
                }));
              },
              icon: Icon(Icons.person))
        ],
        title: Text(context.tr('title')),
      ),
      body: Center(
        child: BlocConsumer<ProductsCubit, ProductsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var Cubit = context.read<ProductsCubit>();
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: Cubit.list.length,
              itemBuilder: (context, index) {
                return ProductItemWidget(product: Cubit.list[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

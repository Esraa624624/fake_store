
import 'package:fake_store/product/data/models/product_model.dart';
import 'package:fake_store/product/presentation/screens/product_details.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product ; 
  const ProductItemWidget({super.key, required this.product });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder :(context) {
          return ProductDetails(product: product);
        },));
      },
      child: Container(
        child:Column(
          children: [
            Container(width: 150,
            height: 120,
            color: Colors.white,
              child: Image.network(product.image,  height: 100,)),
            Text(product.title, maxLines: 1,style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black),),
           // Text(product.description),
            Text('\$${product.price}', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.green),),
      
      
          ],
        ) ,
       
      ),
    );
  }
}
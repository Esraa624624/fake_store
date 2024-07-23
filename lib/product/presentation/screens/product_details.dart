import 'package:fake_store/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product ; 
   ProductDetails({super.key , required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
            Container(width: 200,
            height: 200,
            color: Colors.white,
              child: Image.network(product.image,  height: 100,)),
              SizedBox(height: 50,),
            Text(product.title,style: TextStyle( fontWeight: FontWeight.w900, color: Colors.black,fontSize:18),),
            SizedBox(height: 20,),
            Text(product.description, style: TextStyle(color: Colors.grey),),
            SizedBox(height: 20,),
            Text('\$${product.price}', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.green,fontSize:18),),
      
      
          ],
          ),
        ),
      ),
    );
  }
}
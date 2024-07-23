import 'dart:convert';

import 'package:fake_store/product/data/models/product_model.dart';
import 'package:http/http.dart';

class ProductsRepositeries {
  static Future< List<ProductModel>> getAllProducts ()async{
    var response = await get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body);
     List<ProductModel> products_list=[];
     for (var element in data) {
      ProductModel model =ProductModel.formJson(element);
      products_list.add(model);
     }
     print(data);
     print(products_list);
      return products_list;
  }
  
}
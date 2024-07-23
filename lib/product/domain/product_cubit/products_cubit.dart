import 'package:bloc/bloc.dart';
import 'package:fake_store/product/data/models/product_model.dart';
import 'package:fake_store/product/data/repositeries/products_repositeries.dart';
import 'package:fake_store/product/domain/product_cubit/products_states.dart';


class ProductsCubit extends Cubit<ProductsStates> {
 ProductsCubit():super(IntialState());

List<ProductModel> list =[];

  
  void fatchData()async{
emit(LoadingState());
try{
list = await ProductsRepositeries.getAllProducts();
emit(LoadedState());
}catch(e){
  emit(ErrorState());

}
   
  
  }
  
  
}
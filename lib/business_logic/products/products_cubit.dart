// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure_master1/constants/images.dart';
import 'package:magdsoft_flutter_structure_master1/data/models/productsmodel/product_model.dart';
import 'package:http/http.dart' as http;

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);
  List<YourProduct> itmemProduct = [
  YourProduct(image: ImageAsset.vectorTrophy, name: "All"),
  YourProduct(image: ImageAsset.predatorlogo, name: "Acer"),
  YourProduct(image: ImageAsset.razerLogo, name: "Razer"),
];
  int? selectedIndex;
  bool isLiked=true;
  List<Products> products = [];
  getAllProducts() async {
    emit(ProductsLoadingState());

    final response = await http
        .get(Uri.parse('http://magdsoft.ahmedshawky.fun/api/getProducts'));

    if (response.statusCode == 200) {
      final itemProduct = jsonDecode(response.body);
      final model = ProductModel.fromJson(itemProduct);
      products = model.products ?? [];
      emit(ProductsSuccessState());
    } else {
      emit(ProductsErrorState(message: "Faild"));
    }
  }
  // getAllProducts() async {
  //   emit(ProductsLoadingState());

  //   await http
  //       .get(Uri.parse('http://magdsoft.ahmedshawky.fun/api/getProducts'))
  //       .then((value) {
  //     if (value.statusCode == 200) {
  //       // products = [];
  //       for (var element in jsonDecode(value.body)) {
  //         final pro=ProductModel.fromJson(element);
  //         products=pro.products??[];
  //         // products=pro.

  //       }
  //       emit(ProductsSuccessState());
  //     } else {
  //       emit(ProductsErrorState(message: "Faild"));
  //     }
  //   }).catchError((onError) {
  //     print(onError.toString());
  //     emit(ProductsErrorState(message: "Faild"));
  //   });
  // }
}

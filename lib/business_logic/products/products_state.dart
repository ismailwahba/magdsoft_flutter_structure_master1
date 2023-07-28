// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {}

class ProductsErrorState extends ProductsState {
  String message;
  ProductsErrorState({
    required this.message,
  });
}

part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState {}

final class ProductListInitial extends ProductListState {}

class ProductListLoadingState extends ProductListState {}

// ignore: must_be_immutable
class ProductListFetchedState extends ProductListState {
  List<ProductModel> products = [];
  ProductListFetchedState({
    required this.products, 
  });
}

// ignore: must_be_immutable
class ProductListErrorState extends ProductListState {
  String errorMessage;
  ProductListErrorState({
    required this.errorMessage,
  });
}

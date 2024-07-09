import 'package:equatable/equatable.dart';
import 'package:e_commerce_task/model/product_model.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class FavouriteButtonClickedState extends ProductDetailState {
  final List<ProductModel> favouriteProducts;

  const FavouriteButtonClickedState({required this.favouriteProducts});

  @override
  List<Object> get props => [favouriteProducts];
}

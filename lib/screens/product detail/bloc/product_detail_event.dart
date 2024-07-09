import 'package:equatable/equatable.dart';
import 'package:e_commerce_task/model/product_model.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class FavouriteButtonClickedEvent extends ProductDetailEvent {
  final ProductModel productItem;

  const FavouriteButtonClickedEvent({required this.productItem});

  @override
  List<Object> get props => [productItem];
}

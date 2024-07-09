import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/model/product_model.dart';
import 'package:e_commerce_task/screens/product%20detail/bloc/product_detail_event.dart';
import 'package:e_commerce_task/screens/product%20detail/bloc/product_detail_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<ProductModel> favouriteProduct = [];

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<FavouriteButtonClickedEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (favouriteProduct.contains(event.productItem)) {
        favouriteProduct.remove(event.productItem);
        await prefs.setString('favourite_item', jsonEncode(event.productItem.toJson()));

        print("😡😡😡😡😡");
      } else {
        favouriteProduct.add(event.productItem);
        await prefs.setString('favourite_item', jsonEncode(event.productItem.toJson()));

        print("💎💎💎💎");
      }

      emit(FavouriteButtonClickedState(favouriteProducts: List.from(favouriteProduct)));
    });
  }
}

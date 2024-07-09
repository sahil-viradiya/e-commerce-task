import 'dart:convert';
import 'package:e_commerce_task/utils/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/model/product_model.dart';
import 'package:meta/meta.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  List<ProductModel> productList = [];

  ProductListBloc() : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) {});

    on<ProductListFetchEvent>((event, emit) async {
      emit(ProductListLoadingState());
      try {
        final response = await http.get(
          Uri.parse(Config.baseUrl),
        );
        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);

          productList = data.map((json) => ProductModel.fromJson(json)).toList();
          emit(ProductListFetchedState(products: productList));
        } else {
          // ignore: avoid_print
          print("Failed to load products");
        }
        // ignore: empty_catches
      } catch (e) {
        emit(ProductListErrorState(errorMessage: e.toString()));
      }
    });
  }
}

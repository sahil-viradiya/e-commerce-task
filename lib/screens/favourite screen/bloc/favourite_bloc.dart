import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/model/product_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<ProductModel> favouriteProduct = [];

  final favouriteProductHive = Hive.box('favourite_product');

  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) {});
    on<FetchFavouriteProductEvent>((event, emit) {
      if (favouriteProductHive.get('favourite_product') != null) {
        favouriteProduct = favouriteProductHive.get('favourite_product');
        favouriteProduct = favouriteProduct.map((data) => ProductModel.fromJson(data as Map<String, dynamic>)).toList();
        emit(FavouriteProductFetchedState(favouriteProduct: favouriteProduct));
      }
    });
  }
}

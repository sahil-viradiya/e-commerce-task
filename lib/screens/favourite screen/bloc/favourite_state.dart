part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

// ignore: must_be_immutable
class FavouriteProductFetchedState extends FavouriteState {
  List<ProductModel> favouriteProduct;
  FavouriteProductFetchedState({
    required this.favouriteProduct,
  });
}

class FavouriteLoadingState extends FavouriteState {}

class FavouriteProductEmptyState extends FavouriteState {}

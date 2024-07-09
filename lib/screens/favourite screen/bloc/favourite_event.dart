part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent {}

class FetchFavouriteProductEvent extends FavouriteEvent{
  FetchFavouriteProductEvent();
}
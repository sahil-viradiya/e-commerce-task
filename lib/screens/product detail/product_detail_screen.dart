import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/common/product_info_container.dart';
import 'package:e_commerce_task/model/product_model.dart';
import 'package:e_commerce_task/screens/product%20detail/bloc/product_detail_bloc.dart';
import 'package:e_commerce_task/screens/product%20detail/bloc/product_detail_event.dart';
import 'package:e_commerce_task/screens/product%20detail/bloc/product_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatelessWidget {
  final ProductModel productItem;
  ProductDetailBloc productDetailBloc = ProductDetailBloc();
  ProductDetailScreen({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: Hero(
                      tag: productItem.id,
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) => Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: productItem.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                      // bloc: productDetailBloc,
                      builder: (context, state) {
                        bool isFavorite = false;

                        if (state is FavouriteButtonClickedState) {
                          isFavorite = state.favouriteProducts.contains(productItem);
                        }

                        return IconButton(
                          onPressed: () {
                            BlocProvider.of<ProductDetailBloc>(context)
                                .add(FavouriteButtonClickedEvent(productItem: productItem));
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.black,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              textCmn(txt: productItem.title, size: 17, clr: Colors.black, fontWeight: true, opacity: false),
              const SizedBox(height: 30),
              textCmn(
                  txt: "price :${productItem.price}", size: 15, clr: Colors.black, fontWeight: false, opacity: false),
              const SizedBox(height: 30),
              textCmn(txt: productItem.description, size: 12, clr: Colors.black, fontWeight: false, opacity: false),
            ],
          ),
        ),
      ),
    );
    // return const Scaffold(
    //   body: Center(
    //     child: Text("Hello Sir"),
    //   ),
    // );
  }
}

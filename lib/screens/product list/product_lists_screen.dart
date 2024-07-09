import 'package:e_commerce_task/common/product_info_container.dart';
import 'package:e_commerce_task/screens/favourite%20screen/favourite_screen.dart';
import 'package:e_commerce_task/screens/favourite%20screen/profile_screen.dart';
import 'package:e_commerce_task/screens/product%20detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_task/screens/product%20list/bloc/product_list_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListBloc()..add(ProductListFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: textCmn(txt: "Welcome", size: 20, clr: Colors.black, fontWeight: true, opacity: false),
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavouriteScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite),
            ),
              IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.person),
            )
          ],
        ),
        body: BlocConsumer<ProductListBloc, ProductListState>(
          listener: (context, state) {
            // Implement your listener logic if needed
          },
          builder: (context, state) {
            if (state is ProductListLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductListFetchedState) {
              final productList = state.products;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  mainAxisExtent: 250,
                ),
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = productList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(productItem: product),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 160,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Hero(
                            tag: product.id,
                            child: CachedNetworkImage(
                              progressIndicatorBuilder: (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              imageUrl: product.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        textCmn(
                          txt: product.title,
                          size: 13,
                          clr: Colors.black,
                          fontWeight: false,
                          opacity: false,
                        ),
                        textCmn(
                          txt: "\$${product.price.toString()}",
                          size: 10,
                          clr: Colors.black,
                          fontWeight: false,
                          opacity: false,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is ProductListErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}

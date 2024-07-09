import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_task/common/product_info_container.dart';
import 'package:e_commerce_task/screens/product%20detail/bloc/product_detail_bloc.dart';
import 'package:e_commerce_task/screens/product%20detail/product_detail_screen.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: favouriteProduct.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  mainAxisExtent: 250,
                ),
                itemCount: favouriteProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(productItem: favouriteProduct[index]),
                            ),
                          );
                        },
                        child: Container(
                          height: 160,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Hero(
                            tag: favouriteProduct[index],
                            child: CachedNetworkImage(
                              progressIndicatorBuilder: (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              imageUrl: favouriteProduct[index].image,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10, width: 0),
                      textCmn(
                        txt: favouriteProduct[index].title,
                        size: 13,
                        clr: Colors.black,
                        fontWeight: false,
                        opacity: false,
                      ),
                      textCmn(
                        txt: "\$${favouriteProduct[index].price.toString()}",
                        size: 10,
                        clr: Colors.black,
                        fontWeight: false,
                        opacity: false,
                      ),
                    ],
                  );
                },
              )
            : const Center(
                child: Text(
                  "No Favourite Product Avilable",
                  style: TextStyle(color: Colors.black),
                ),
              ),
      ),
    );
  }
}

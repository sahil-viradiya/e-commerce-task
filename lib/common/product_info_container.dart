import 'package:e_commerce_task/model/product_model.dart';
import 'package:flutter/material.dart';

Widget productInfoContainer(
    {
    // required Color clr,image.png
    // required String img,
    // required String text,
    // required String price,
    // required BuildContext context,
    required ProductModel productList}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetailScreenShop(product: product),
          //   ),
          // );
        },
        child: Container(
          height: 160,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Hero(
            tag: productList.id,
            child: Image.network(
              productList.image,
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
            ),
          ),
        ),
      ),
      const SizedBox(height: 10, width: 0),
      textCmn(
        txt: productList.title,
        size: 20,
        clr: Colors.black,
        fontWeight: false,
        opacity: true,
      ),
      textCmn(
        txt: "\$${productList.price.toString()}",
        size: 17,
        clr: Colors.black,
        fontWeight: false,
        opacity: false,
      ),
    ],
  );
}

Text textCmn(
    {required String txt, required double size, required Color clr, required bool fontWeight, required bool opacity}) {
  return Text(
    txt,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: size, color: opacity ? clr.withOpacity(0.23) : clr, fontWeight: fontWeight ? FontWeight.bold : null),
  );
}

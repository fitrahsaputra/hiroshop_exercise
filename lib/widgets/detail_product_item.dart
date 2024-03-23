import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

List<Widget> detailProductItem(BuildContext context) {
  final productId = ModalRoute.of(context)!.settings.arguments as int;
  final data = Provider.of<ProductProvider>(context)
      .dataProduct
      .firstWhere((element) => element.id == productId);
  final cart = Provider.of<CartProvider>(context, listen: false);

  return [
    Image.network(data.imageUrl),
    Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name Product:\n${data.name}\n'),
          Text('Price:\nRp ${data.price}\n'),
          Text('Description:\n${data.desc}'),
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        onPressed: () {
          cart.addToCart(data.id, data.name, data.price);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully add product to cart!'),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        child: const Text(
          'Add to Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  ];
}
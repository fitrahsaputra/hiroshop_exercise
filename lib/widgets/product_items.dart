import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../pages/detail_product.dart';

List<Widget> productItems(BuildContext context) {
  final product = Provider.of<ProductProvider>(context, listen: false);
  final cart = Provider.of<CartProvider>(context, listen: false);

  return product.dataProduct
      .map(
        (data) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, DetailProduct.nameRoute,
                arguments: data.id);
          },
          child: GridTile(
            header: GridTileBar(
              leading: Consumer<ProductProvider>(
                builder: (context, value, child) => IconButton(
                    onPressed: () {
                      product.statusFavorite(data);
                    },
                    icon: (data.isFavorite)
                        ? const Icon(Icons.favorite_border_rounded)
                        : const Icon(Icons.favorite)),
              ),
            ),
            footer: GridTileBar(
              backgroundColor: const Color.fromRGBO(124, 81, 0, 0.498),
              title: Text(data.name),
              subtitle: Text('Rp ${data.price.toString()}'),
              trailing: IconButton(
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
                  icon: const Icon(Icons.shopping_bag_rounded)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      )
      .toList();
}

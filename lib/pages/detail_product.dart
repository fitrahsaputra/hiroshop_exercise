import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/detail_product_item.dart';
import 'cart._view.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key});

  static const nameRoute = '/detail_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) => Badge(
              label: Text(value.length.toString()),
              alignment: Alignment.topRight,
              offset: Offset.zero,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartView.nameRoute);
                },
                icon: const Icon(Icons.shopping_bag_rounded),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: detailProductItem(context),
      ),
    );
  }
}

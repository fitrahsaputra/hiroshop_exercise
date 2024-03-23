import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/product_items.dart';
import 'cart._view.dart';

class HomeOverview extends StatelessWidget {
  const HomeOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hiro Shop'),
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
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        children: productItems(context),
      ),
    );
  }
}

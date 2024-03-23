import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const nameRoute = '/cart_view';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final dataCart = cart.cartItem.entries;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Consumer<CartProvider>(
              builder: (context, value, child) => Text(
                'Total Purchase: Rp ${cart.calculateTotalPurchase}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, value, child) 
              => ListView(
                children: dataCart
                    .map(
                      (data) => Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(200, 200, 200, 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name Product:\n${data.value.name}\n'),
                                  Text('Price:\nRp ${data.value.price}\n'),
                                  Consumer<CartProvider>(
                                    builder: (context, value, child) => Text(
                                        'Total Price:\nRp ${data.value.price * data.value.qty}'),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cart.deleteItemCart(data.value.id);
                                      },
                                      icon: Icon((Icons.delete)))
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    cart.removeQty(data.value);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                              Consumer<CartProvider>(
                                  builder: (context, value, child) =>
                                      Text('Qty: ${data.value.qty}')),
                              TextButton(
                                  onPressed: () {
                                    cart.addQty(data.value);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ]),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

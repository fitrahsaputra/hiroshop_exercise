import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _dataProduct = List.generate(
    30,
    (index) => Product(
        id: index + 1,
        imageUrl: 'https://picsum.photos/id/$index/450',
        name: faker.person.name(),
        price: faker.currency.random.integer(100000, min: 50000),
        desc: faker.lorem.sentence(),
        isFavorite: true),
  );

  List<Product> get dataProduct => _dataProduct;

  void statusFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}

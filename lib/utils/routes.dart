import 'package:flutter/material.dart';

import '../pages/cart._view.dart';
import '../pages/detail_product.dart';

Map<String, WidgetBuilder> get myRoutes {
  return {
    DetailProduct.nameRoute: (context) => const DetailProduct(),
    CartView.nameRoute: (context) => const CartView(),
  };
}

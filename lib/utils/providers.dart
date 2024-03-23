import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

List<SingleChildWidget> get myProviders {
  return [
    ChangeNotifierProvider(create: (context) => ProductProvider()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
  ];
}

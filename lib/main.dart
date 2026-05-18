import 'package:prm_lab/entities/Product.dart';

void main() {
  Product product = Product.fromJson({
    "name": "Lily House",
    "price": 120000.0,
    "image": "img",
    "id": 0
  });
  // product.printProduct();
  product.increasePriceBy10Percent();
  print("----------------------");
  product.printListProduct();
}
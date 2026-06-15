import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prm393_lab/entities/ui/Product.dart';
import 'package:prm393_lab/shares/system_provider.dart';

class ProductDetail extends ConsumerWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Product product = ref.watch(selectedProduct);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: Text(product.name ?? ""),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                width: double.infinity,
                fit: BoxFit.cover,
                product.image!,
              ),
            ),
            Text(
              product.name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("${product.price.toString()}\$"),
            Text(product.description!),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prm393_lab/shares/system_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(myCartProvider);

    return cart.isEmpty
        ? const Center(
            child: Text("Cart is empty", style: TextStyle(fontSize: 18)),
          )
        : ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final product = cart[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      product.image ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(product.name ?? ""),
                  subtitle: Text("${product.price?.toStringAsFixed(2) ?? 0}\$"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref.read(myCartProvider.notifier).state = cart
                          .where((e) => e.id != product.id)
                          .toList();
                    },
                  ),
                ),
              );
            },
          );
  }
}

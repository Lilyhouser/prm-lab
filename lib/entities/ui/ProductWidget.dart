import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prm393_lab/entities/ui/Product.dart';
import 'package:prm393_lab/pages/product_detail.dart';
import 'package:prm393_lab/shares/system_provider.dart';

class ProductWidget extends ConsumerStatefulWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  ConsumerState<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(myCartProvider);
    final bool isFavourite = cart.contains(widget.product);

    return InkWell(
      onTap: () {
        ref.read(selectedProduct.notifier).state = widget.product;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetail()),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      widget.product.image!,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      onPressed: () {
                        final cart = ref.read(myCartProvider.notifier);
                        if (isFavourite) {
                          cart.remove(widget.product);
                        } else {
                          cart.add(widget.product);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: isFavourite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text("${widget.product.price.toString()}\$"),
                  ],
                ),
              ),
              Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                widget.product.description!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

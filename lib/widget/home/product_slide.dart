import 'package:flutter/material.dart';
import 'package:from_design/model/pop_product_model.dart';

class ProductSlide extends StatelessWidget {
  final List<PopProduct> products;

  const ProductSlide({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, 
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length ~/ 3, 
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          int startIndex = index * 3;
          int endIndex = (startIndex + 3 < products.length) ? startIndex + 3 : products.length;
          List<PopProduct> batch = products.sublist(startIndex, endIndex);

          return SizedBox(
            width: 250, 
            child: Column(
              children: batch
                  .map(
                    (product) => Expanded(
                      child: ProductItem(product: product),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final PopProduct product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              product.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rp ${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

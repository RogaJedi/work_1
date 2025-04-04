import 'package:flutter/material.dart';
import 'package:work_1/product.dart';
import '../api_service.dart';
import '../product_card/product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final ApiService apiService;
  final Function() onTap;

  const ProductCarousel({
    super.key,
    required this.products,
    required this.apiService,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductCard(
                product: products[index],
                apiService: apiService,
                onTap: onTap,
              ),
            ),
          );
        },
      ),
    );
  }
}
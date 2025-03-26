import 'package:flutter/material.dart';
import 'package:work_1/product.dart';
import '../api_service.dart';
import '../product_card/product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final ApiService apiService;

  const ProductCarousel({
    super.key,
    required this.products,
    required this.apiService,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 200,
            height: 190,
            child: ProductCard(
              product: products[index],
              apiService: apiService,
              onCardTap: () => print("Product ${products[index].productId} tapped"),
            ),
          ),
        );
      },
    );
  }
}

//using carousel slider
/*
class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final ApiService apiService;

  const ProductCarousel({
    required this.products,
    required this.apiService,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: products.length,
      itemBuilder: (context, index, realIndex) {
        return SizedBox(  // or Container
          width: 200,     // Your desired width
          height: 190,    // Your desired height
          child: ProductCard(
            product: products[index],
            apiService: apiService,
            onCardTap: () {
              // Your onTap logic
            },
          ),
        );
      },
      options: CarouselOptions(
        height: 300,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
 */

//() => print("Product ${products[index].productId} tapped"),
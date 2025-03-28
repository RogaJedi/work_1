import 'package:flutter/material.dart';
import 'package:work_1/product.dart';

class BigCard extends StatelessWidget {
  final Product product;
  final Function() onCardTap;

  const BigCard({
    super.key,
    required this.product,
    required this.onCardTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product.image,
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20,),
                      SizedBox(
                          width: 350,
                          height: 45,
                          child: Text(
                              product.name,
                            style: const TextStyle(
                              fontSize: 20
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                            "${product.price} P",
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xFFf1c232), size: 22,),
                              Text(
                                  "${product.reviewScore}",
                                style: const TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 4,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
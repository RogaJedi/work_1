import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_1/product.dart';
import 'package:work_1/product_card/PC_SM/PC_Cubit.dart';
import 'package:work_1/product_card/PC_SM/PC_State.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("card tapped");
      },
      child: Container(
        width: 200,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    product.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    SizedBox(
                        width: 160,
                        height: 40,
                        child: Text(product.name)
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("${product.price} P"),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Color(0xFFf1c232), size: 15,),
                            Text("${product.reviewScore}"),
                          ],
                        )
                    ),
                  ],
                )
              ],
            ),
            Positioned(
                top: 1,
                right: 1,
                child: BlocBuilder<ProductCardCubit, ProductCardState> (
                    builder: (context, state){
                      return IconButton(
                        icon: Icon(
                          state.favorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.read<ProductCardCubit>().toggleFavorite();
                        },
                      );
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}
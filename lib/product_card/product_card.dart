import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_1/api_service.dart';
import 'package:work_1/product.dart';
import 'package:work_1/product_card/PC_SM/PC_Bloc.dart';
import 'package:work_1/product_card/PC_SM/PC_State.dart';

import 'PC_SM/PC_Event.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ApiService apiService;
  final Function() onCardTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.apiService,
    required this.onCardTap
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCardBloc(
          apiService: apiService,
        )..add(CheckFavoriteStatusEvent(productId: product.productId)),
        child: GestureDetector(
          onTap: onCardTap,
          child: Container(
            width: 200.w,
            height: 190.h,
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
                        height: 120.h,
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
                  child: BlocBuilder<ProductCardBloc, ProductCardState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        );
                      }

                      return IconButton(
                        icon: Icon(
                          state.favorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.read<ProductCardBloc>().add(
                            ToggleFavoriteEvent(productId: product.productId),
                          );

                          if (state.error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error!)),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
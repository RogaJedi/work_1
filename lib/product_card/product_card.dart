import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
        create: (context) => ProductCardBloc(
          apiService: apiService,
        )..add(CheckFavoriteStatusEvent(productId: product.productId)),
        child: GestureDetector(
          onTap: onCardTap,
          child: Container(
            width: screenWidth * 0.5,
            height: screenHeight * 0.205,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        product.image,
                        height: screenHeight * 0.13,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 2,),
                    //160-40
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.045, right: screenWidth * 0.045),
                      child: SizedBox(
                        height: screenHeight * 0.045,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width - screenWidth * 0.09, // Account for padding
                            child: Text(
                              product.name,
                              style: const TextStyle(fontSize: 40),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.045),
                          child: Text(
                              "${product.price} P",
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.045),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Color(0xFFf1c232), size: screenWidth * 0.037,),
                                Text(
                                    "${product.reviewScore}",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
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
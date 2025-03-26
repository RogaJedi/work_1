import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_1/buttons/cancel.dart';
import 'package:work_1/buttons/confirm.dart';
import 'package:work_1/product.dart';
import 'package:work_1/product_card/PC_SM/PC_Cubit.dart';
import 'package:work_1/product_card/PC_SM/PC_State.dart';
import 'package:work_1/product_card/product_card.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => ProductCardCubit(ProductCardState()),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

List<Product> products = [
  Product(
      name: "Салат",
      price: 560,
      image: "https://cdn.loveandlemons.com/wp-content/uploads/2024/12/caesar-salad.jpg",
      reviewScore: 4.9
  ),
  Product(
      name: "Суп",
      price: 490,
      image: "https://cdn.loveandlemons.com/wp-content/uploads/2023/01/tomato-soup-recipe.jpg",
      reviewScore: 4.2
  ),
  Product(
      name: "Газировка",
      price: 180,
      image: "https://media.istockphoto.com/id/1393991948/ru/фото/кола-с-измельченным-льдом-в-стекле-и-каплями-воды-вокруг-холодный-черный-свежий-напиток.jpg?s=612x612&w=0&k=20&c=zw1iOSozCZ0-PW_mYtJWPDzBBWYUdk-YzeIOF10NDXo=",
      reviewScore: 5.0
  ),
  Product(
      name: "Курица",
      price: 670,
      image: "https://static01.nyt.com/images/2024/01/05/multimedia/MC-Peruvian-Roast-Chicken-ztlg/MC-Peruvian-Roast-Chicken-ztlg-mediumSquareAt3X.jpg",
      reviewScore: 4.6
  ),
  Product(
      name: "Жареный лосось с овощами",
      price: 890,
      image: "https://mealpractice.b-cdn.net/129286207963271168/grilled-salmon-with-roasted-vegetables-and-quinoa-MRYW9u3TAG.webp",
      reviewScore: 4.7
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
        body: Stack(
          children: [
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Cancel(color: Color(0xFF000118), text: "Отмена"),
                    //Confirm(color: Color(0xFF6E66FE), text: "Подтвердить"),
                    ProductCard(product: products[4])
                  ],
                )
            )
          ],
        )
    );
  }
}


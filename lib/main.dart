import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_1/api_service.dart';
import 'package:work_1/big_card/big_card.dart';
import 'package:work_1/buttons/cancel.dart';
import 'package:work_1/buttons/confirm.dart';
import 'package:work_1/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:work_1/product.dart';
import 'package:work_1/product_card/product_card.dart';
import 'package:work_1/product_carousel/product_carousel.dart';
import 'package:work_1/status_track/ST_SM/ST_Bloc.dart';
import 'package:work_1/status_track/ST_SM/ST_Event.dart';
import 'package:work_1/status_track/status_track.dart';



void main() {
  runApp(const MyApp());
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
      productId: "0",
      name: "Салат",
      price: 560,
      image: "https://cdn.loveandlemons.com/wp-content/uploads/2024/12/caesar-salad.jpg",
      reviewScore: 4.9
  ),
  Product(
      productId: "1",
      name: "Суп",
      price: 490,
      image: "https://cdn.loveandlemons.com/wp-content/uploads/2023/01/tomato-soup-recipe.jpg",
      reviewScore: 4.2
  ),
  Product(
      productId: "2",
      name: "Газировка",
      price: 180,
      image: "https://media.istockphoto.com/id/1393991948/ru/фото/кола-с-измельченным-льдом-в-стекле-и-каплями-воды-вокруг-холодный-черный-свежий-напиток.jpg?s=612x612&w=0&k=20&c=zw1iOSozCZ0-PW_mYtJWPDzBBWYUdk-YzeIOF10NDXo=",
      reviewScore: 5.0
  ),
  Product(
      productId: "3",
      name: "Курица",
      price: 670,
      image: "https://static01.nyt.com/images/2024/01/05/multimedia/MC-Peruvian-Roast-Chicken-ztlg/MC-Peruvian-Roast-Chicken-ztlg-mediumSquareAt3X.jpg",
      reviewScore: 4.6
  ),
  Product(
      productId: "4",
      name: "Жареный лосось с овощами",
      price: 890,
      image: "https://mealpractice.b-cdn.net/129286207963271168/grilled-salmon-with-roasted-vegetables-and-quinoa-MRYW9u3TAG.webp",
      reviewScore: 4.7
  ),
];

List<Color> colors = [
  Color(0xFF000118),
  Color(0xFFC8CDFF),
  Color(0xFF4B48AC),
  Color(0xFF6E66FE),
];


final apiService = MockApiService();


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Color(0xFFEEEEEE)
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                    Column(
                      children: [
                        Cancel(color: Colors.grey, icon: Icons.cancel_outlined, onPressed: () => print("button pressed"),),
                        SizedBox(height: 10,),
                        SizedBox(
                            height: 60,
                            child: Confirm(color: Color(0xFF6E66FE), text: "Подтвердить", onPressed: () => print("button pressed"),)
                        ),
                      ],
                    ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text('Show Alert'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Alert Title'),
                            content: Container(
                              width: 200,
                              height: 400,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 10,
                                      child: Confirm(
                                        color: Color(0xFF6E66FE),
                                        text: "Подтвердить",
                                        onPressed: () => print("button pressed"),
                                      )
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )

                  /*
                    ProductCard(
                      product: products[0],
                      apiService: apiService,
                      onCardTap: () => print("card tapped"),
                    )
                     */

                  /*
                    ProductCarousel(
                      products: products,
                      apiService: apiService,
                      onCardTap: () => print("card tapped"),
                    )
                     */

                  /*
                    BigCard(
                      picture: "https://interiordesign.net/wp-content/uploads/2024/04/InteriorDesign_March2024_Brave-New-World-11.jpg",
                      onCardTap: () => print("card tapped"),
                      mainText: "Забронируйте у нас столик",
                      subText: "Мы будем рады видеть вас в нашем ресторане в любой удобный день",
                    )
                     */

                  /*
                  BlocProvider(
                    create: (context) => StatusTrackBloc(
                      apiService: apiService,
                      orderId: "0",
                    )..add(InitializeTrackStatus()),
                    child: Builder(
                      builder: (context) => Column(
                        children: [
                          StatusTrack(
                            activeTrackColor: Color(0xFF4B48AC),
                            inactiveTrackColor: Colors.grey,
                            apiService: apiService,
                            orderId: "0",
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<StatusTrackBloc>().add(UpdateTrackStatus(0));
                                },
                                child: Text('Status 0'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<StatusTrackBloc>().add(UpdateTrackStatus(1));
                                },
                                child: Text('Status 1'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<StatusTrackBloc>().add(UpdateTrackStatus(2));
                                },
                                child: Text('Status 2'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<StatusTrackBloc>().add(UpdateTrackStatus(3));
                                },
                                child: Text('Status 3'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                   */




                ],
              )
          )
        ],
      ),
      /*
      bottomNavigationBar: CustomBottomBar(
        icons: const [
          Icons.home,
          Icons.search,
          Icons.favorite,
          Icons.person,
        ],
        onPressed: (index) {
          print('Tapped index: $index');
        },
        selectedColor: Color(0xFF4B48AC),
        unselectedColor: Color(0xFFC8CDFF),
        splashColor: Color(0xFF6E66FE),
      ),

       */
    );
  }
}


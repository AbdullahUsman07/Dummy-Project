import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String foodItem = 'Pizza';

  void _changeimage(String img) {
    setState(() {
      foodItem = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food Delivery',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeCatogery(itemName: "Pizza"),
                        makeCatogery(itemName: "Burger"),
                        makeCatogery(itemName: "Pasta"),
                        makeCatogery(itemName: "Salad"),
                        makeCatogery(itemName: "Desert"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Free Delivery',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            createfoodlist(foodItem),
            
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }



  Widget makeCatogery({required String itemName}) {
    return AspectRatio(
      aspectRatio: 2.0 / 1,
      child: Container(
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          child: MaterialButton(
            onPressed: () {
              _changeimage(itemName);
            },
            child: Align(
              child: Text(
                itemName,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w100,
                    fontSize: 18),
              ),
            ),
          )),
    );
  }

  Widget makeImage({required String image}) {
    return AspectRatio(
        aspectRatio: 1 / 1.5,
        child: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.1),
                  ])),
              child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                      Column(children: [
                        Text('\$ 15.00 ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0)),
                      ])
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget createfoodlist(String fooditem) {
        
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              makeImage(image: "assets/images/$fooditem-1.jpg"),
              makeImage(image: "assets/images/$fooditem-2.jpg"),
              makeImage(image: "assets/images/$fooditem-3.jpg"),
            ],
          )),
    );
  }
}

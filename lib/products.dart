import 'package:flutter/material.dart';
import 'package:service_system/product_card_item.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductCard(
                ProductName: "Nike Shoes",
                Price: "1500 \$",
                imgUrl: 'assets/images/pr2.png',
                Description:
                    "This is short description about this products This is short description about this products about this products this",
                Status: "Available",
                offered: false,
              ),
              ProductCard(
                ProductName: "Perfume",
                Price: "1200 \$",
                imgUrl: 'assets/images/pr5.png',
                Description:
                    "This is short description about this products This is short description about this products about this products this",
                Status: "Soon",
                offered: false,
              ),
              ProductCard(
                ProductName: "Perfume",
                Price: "1300 \$",
                imgUrl: 'assets/images/pr3.jpg',
                Description:
                    "This is short description about this products This is short description about this products about this products this",
                Status: "Available After 2 week",
                offered: false,
              ),
              ProductCard(
                ProductName: "Perfume",
                Price: "1100 \$",
                imgUrl: 'assets/images/pr5.png',
                Description:
                    "This is short description about this products This is short description about this products about this products this",
                Status: "Available After 2 months",
                offered: false,
              ),
              ProductCard(
                ProductName: "Nike Shoes",
                Price: "1500 \$",
                imgUrl: 'assets/images/pr2.png',
                Description:
                    "This is short description about this products This is short description about this products about this products this",
                Status: "Available",
                offered: false,
              ),
              ProductCard(
                ProductName: "Nike Shoes",
                Price: "1500 \$",
                imgUrl: 'assets/images/pr2.png',
                Description:
                    "This is short description about this products This is short description about this products about this products this",
                Status: "Available",
                offered: false,
              ),
            ],
          ),
        )
        /* GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (_, index) => ProductCard(),
        itemCount: 8,
      ),
      */
/*
      GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        children: List.generate(40, (index) {
          return ProductCard();
        }),
      ),
      */
        );
  }
}

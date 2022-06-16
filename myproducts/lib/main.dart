import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Listing"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
              name: "iPhone",
              description: "Most stylish phone ever",
              price: 1000,
              image: "iPhone.png"),
          ProductBox(
              name: "Pixel",
              description: "Pixel has many features",
              price: 2000,
              image: "pixel.png"),
          ProductBox(
              name: "Laptop",
              description: "Laptop is the most productive tool ever",
              price: 2000,
              image: "laptop.png"),
          ProductBox(
              name: "Tablet",
              description: "Useful device for meetings",
              price: 2000,
              image: "pixel.png"),
          ProductBox(
              name: "Pendrive",
              description: "For file storage ",
              price: 20,
              image: "pendrive.png"),
          ProductBox(
              name: "Floppy",
              description: "outmoded but still favorite for nerds",
              price: 2,
              image: "floppy.png"),
        ],
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  RatingBoxState createState() => RatingBoxState();
}

class RatingBoxState extends State<RatingBox> {
  int rating = 0;

  void setRatingAsOne() {
    setState(() {
      rating = 1;
    });
  }

  void setRatingAsTwo() {
    setState(() {
      rating = 2;
    });
  }

  void setRatingAsThree() {
    setState(() {
      rating = 3;
    });
  }

  Widget build(BuildContext context) {
    double size = 20;
    print(rating);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (rating >= 1
                  ? Icon(
                      Icons.star,
                      size: size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: size,
                    )),
              color: Colors.red[500],
              onPressed: setRatingAsOne,
              iconSize: size,
            )),
        Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (rating >= 2
                  ? Icon(
                      Icons.star,
                      size: size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: size,
                    )),
              color: Colors.red[500],
              onPressed: setRatingAsTwo,
              iconSize: size,
            )),
        Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (rating >= 3
                  ? Icon(
                      Icons.star,
                      size: size,
                    )
                  : Icon(
                      Icons.star_border,
                      size: size,
                    )),
              color: Colors.red[500],
              onPressed: setRatingAsThree,
              iconSize: size,
            ))
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/app/" + image),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(this.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(this.description),
                      Text("Price: " + this.price.toString()),
                      RatingBox(),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.imgUrl});
  final List imgUrl;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            autoPlayInterval: Duration(milliseconds: 500)),
        items: widget.imgUrl.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  // width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                          image: NetworkImage(i), fit: BoxFit.fitHeight)));
            },
          );
        }).toList(),
      ),
    );
  }
}

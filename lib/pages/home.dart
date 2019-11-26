import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int photoIndex = 0;
  List<String> imgList = [
    'images/banner-lrt.jpg',
    'images/banner-sibeton.jpg',
    'images/banner-slagsilo.jpg',
    'images/banner-soetta.jpg',
    'images/banner-hut6.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              height: 205.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 2),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  photoIndex = index;
                });
              },
              items: imgList.map((imgAsset) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Image.asset(
                        imgAsset,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: photoIndex == index ? Colors.redAccent : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}

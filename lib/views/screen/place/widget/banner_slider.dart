import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/data.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({ Key? key, required this.sliderHeight }) : super(key: key);
  final double sliderHeight;

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
        children: [
          ClipPath(
            child: Container(
              width: double.infinity,
              height: 317.0,
              // color: Colors.orange,
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: widget.sliderHeight,
                  autoPlay: true,
                  // aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1.3,
                  // enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
                ),
                // List Body Slider
                items: imgList.map((item) => Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        item, fit: BoxFit.cover, width: Size.infinite.width, height: widget.sliderHeight,
                      ),
                      Container( color: Color.fromARGB(99, 40, 78, 59) ),
                    ],
                  ),
                )).toList(),
              )
            ),
            clipper: RoundedClipper(),
          ),
          
          // Display List Indicators
          Container(
              height: widget.sliderHeight,
              padding: EdgeInsets.only(right: 15, bottom: 37),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 16.0,
                              height: 16.0,
                              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.5, color: _current == entry.key ? mainTextColor:Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: _current == entry.key ? mainTextColor : whiteColor.withOpacity(0.6)
                              ),
                            ),
                          ],
                        )
                      );
                  }).toList(),
              ),
          )
        ],
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-50);
    path.quadraticBezierTo(
    size.width / 2, 
    size.height,
    size.width,
    size.height - 50
  );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../globals.dart';
import 'lockIn_button.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String _currentMap = "assets/images/Main_Wallpaper.png";

  void _toggleBackground(index){
    setState(() {
      _currentMap = index;
    });
  }

  bool isCurrentMap(index){
    if (_currentMap != "assets/images/Main_Wallpaper.png"){

      if (index == _currentMap){return true;}else{return false;}
    }
    return false;
  }

  Text mapTitleGen(String text, double opacity){
    return Text(text, style: tungstenBoldFont(Colors.white, 125, opacity: opacity),);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          mapTitleGen(_currentMap.split("/")[2].split(".")[0].toUpperCase(), 0.7),
        ],),
        Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_currentMap), //Background Image
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30.0),
              height: 400,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('SELECT YOUR MAP', style: valorantFont(Colors.white, 16),

                      ),
                    ),
                    const Divider(),
                    buildCarouselSlider(),
                    const Divider(),
                    const LockInButton(),
                  ]),
            ),
          ),
        ),
      ],
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.28,
                autoPlay: false,
                height: 100,
                enableInfiniteScroll: false,
                initialPage: 1,
              ),
              items: carouselImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: (){
                        _toggleBackground(i);
                        selectedMap = i;
                      },
                      child: Stack(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: isCurrentMap(i) ? Colors.redAccent : Colors.transparent, width: 2.0)
                              ),
                            child: Image.asset(i, fit: BoxFit.cover),
                          ),
                          Center(child: Text(i.split("/")[2].split(".")[0].toUpperCase(), style: tungstenBoldFont(Colors.white, 26),))
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            );
  }
}
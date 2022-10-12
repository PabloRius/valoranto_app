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
  String _curentAgent = "";
  
  void _toggleAgent(index){
    setState(() {
      var lista = index.split("/");
      _curentAgent = "assets/images/Agent_Body/${lista[3]}";
    });
  }

  bool isCurrentMap(index){
    if (_currentMap != "assets/images/Main_Wallpaper.png"){

      if (index == _currentMap){return true;}else{return false;}
    }
    return false;
  }

  FittedBox AgentTitleGen(String text, double opacity){
    if (_curentAgent != ""){
      String aux = text.split("/")[3].split(".")[0].toUpperCase();
      return FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            aux,
            style: tungstenBoldFont(Colors.white, 200, opacity: opacity),));
    }else{
      String aux = selectedMap.split("/")[2].split(".")[0].toUpperCase();
      return FittedBox(child: Text(aux, style: tungstenBoldFont(Colors.white, 125, opacity: opacity),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectedMap), //Background Image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: AgentTitleGen(_curentAgent, 0.7)),
            Center(child: AgentTitleGen(_curentAgent, 0.6)),
            Center(child: AgentTitleGen(_curentAgent, 0.5)),
            Center(child: AgentTitleGen(_curentAgent, 0.4)),
          ],),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent
                  ]
              )
          ) ,
        ),
        Center(
          child: Container(
            height: 650,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_curentAgent), //Background Image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Align(
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
      items: carouselAgents.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: (){
                _toggleAgent(i);
                selectedAgent = i;
                print(i.split("/"));
              },
              child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: kGray800,
                        border: Border.all(
                            color: isCurrentMap(i) ? Colors.redAccent : Colors.transparent,
                            width: isCurrentMap(i) ? 2.0 : 0.0)
                    ),
                    child: Image.asset(i, fit: BoxFit.cover,),
                  )
            );
          },
        );
      }).toList(),
    );
  }
}
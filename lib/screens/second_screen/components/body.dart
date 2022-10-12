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

  final String _currentMap = "assets/images/Main_Wallpaper.png";
  String _currentAgent = "";
  
  void _toggleAgent(index){
    setState(() {
      var lista = index.split("/");
      _currentAgent = "assets/images/Agent_Body/${lista[3]}";
    });
  }

  bool isCurrentAgent(index){
    if (_currentAgent != ""){
      String name_i = index.split("/")[3].split(".")[0];
      String name_c = _currentAgent.split("/")[3].split(".")[0];
      if (name_i == name_c){return true;}else{return false;}
    }
    return false;
  }

  Text agentTitleGen(String text, double opacity){
    if (_currentAgent != ""){
      String aux = text.split("/")[3].split(".")[0].toUpperCase();
      return Text(
              aux,
              style: tungstenBoldFont(Colors.white, 200, opacity: opacity),
      );
    }else{
      String aux = selectedMap.split("/")[2].split(".")[0].toUpperCase();
      return Text(
              aux,
              style: tungstenBoldFont(Colors.white, 125, opacity: opacity),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackground(),
        buildAgentNames(),
        buildGradient(),
        agentBodyException(),
        buildBottom(),
      ],
    );
  }

  Container buildBackground() {
    return Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedMap), //Background Image
            fit: BoxFit.cover,
          ),
        ),
      );
  }

  Padding buildAgentNames() {
    return Padding(
      padding: const EdgeInsets.only(top:30),
      child: Align(
        alignment: Alignment.topCenter,
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                agentTitleGen(_currentAgent, 0.7),
                agentTitleGen(_currentAgent, 0.6),
                agentTitleGen(_currentAgent, 0.5),
                agentTitleGen(_currentAgent, 0.4),
              ],),
        ),
      ),
    );
  }

  Container buildGradient() {
    return Container(
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
      );
  }

  Center agentBodyException() {
    if (_currentAgent != ""){
      return Center(
        child: Image.asset(
          _currentAgent,
          height: 650,
          fit: BoxFit.cover,
        ),
      );
    }else{
      return const Center();
    }

  }

  Align buildBottom() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          height: 400,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('SELECT AGENT', style: valorantFont(Colors.white, 16),

                  ),
                ),
                const Divider(),
                buildCarouselSlider(),
                const Divider(),
                const LockInButton(),
              ]),
        ),
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
              },
              child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: kGray800,
                        border: Border.all(
                            color: isCurrentAgent(i) ? Colors.redAccent : Colors.transparent,
                            width: isCurrentAgent(i) ? 2.0 : 0.0)
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
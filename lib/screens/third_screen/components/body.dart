import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../constants.dart';
import '../../../globals.dart';
import 'lockIn_button.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String _currentAbility = "";

  bool isCurrentAbility(index){
    if (_currentAbility != ""){
      String nameI = "${index}_${selectedAgent}";
      if (nameI == _currentAbility){return true;}else{return false;}
    }
    return false;
  }

  void _toggleAbility(index){
    setState(() {
      _currentAbility = "${index}_$selectedAgent";
      selectedAbility = _currentAbility;
    });
  }

  late VideoPlayerController _controller = VideoPlayerController.asset("assets/videos/Abilities/Viper/C_Viper.mp4");

  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/Abilities/Viper/C_Viper.mp4")..initialize().then((_){
      _controller.play();
      _controller.setLooping(true);
      setState(() {

      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        buildBackground(),
        buildGradient(),
        buildDecorations(),
        buildBottom(),
      ],
    );
  }

  SizedBox buildBackground() {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  Container buildBottom() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Text('SELECT ABILITY', style: valorantFont(Colors.white, 16),
                ),
              ),
              const Divider(),
              abilitiesContainer(context),
              const Divider(),
              const LockInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Stack abilitiesContainer(BuildContext context) {

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          abilitiesMap.map((i){
            return GestureDetector(
                onTap: (){
                  _toggleAbility(i);
                },
                child: Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: isCurrentAbility(i) ? kGray300 : kGray90,
                      border: Border.all(
                          color: Colors.transparent,
                          width: isCurrentAbility(i) ? 0.0 : 2.0)
                  ),
                  child: Image.asset("assets/images/Abilities/$selectedAgent/${i}_$selectedAgent.png", fit: BoxFit.cover,),
                )
            );
          }).toList(),
        ),
      ],
    );
  }

  Expanded genExpanded(String image) {
    return Expanded(
      child: GestureDetector(
        onTap: (){},
        child: Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 6.5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                      color: /*isCurrentAgent(i) ? Colors.redAccent :*/ Colors.black,
                      width: /*isCurrentAgent(i) ? 2.0 :*/ 0.8)
          ),
          child: Image.asset(image,color: Colors.black.withOpacity(0.5), fit: BoxFit.cover,),
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
                Colors.white,
                Colors.transparent
              ]
          )
      ) ,
    );
  }

  Stack buildDecorations() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 155.0),
          child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child:Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.black, width: 1))),)),
        ),
        Container(
          margin: EdgeInsets.only(right: 300.0, bottom: 130),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 1,
              decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: Colors.white, width: 1.6))),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 58, bottom: 104),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 4,
              width: 4,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

}
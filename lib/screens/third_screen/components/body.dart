import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../constants.dart';
import '../../../globals.dart';
import 'lite_rolling_switch.dart';
import 'lockIn_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _currentAbility = "";
  late Future<String> presentations;
  Future<void> setPresentation(String ability) async{
    //var url = Uri.https('pablorius.github.io','presentations/$selectedAgent.json');
    var url = Uri.https('pablorius.github.io','presentations/$selectedAgent.json');
    final response = await http.get(url);
    var video = convert.json.decode(response.body)[ability];
    setState(() {
        _controller = VideoPlayerController.network(video)..initialize().then((_){
        _controller.play();
        _controller.setLooping(true);
        setState(() {
        });
      });
    });
  }

  bool isCurrentAbility(index) {
    if (_currentAbility != "") {
      String nameI = "${index}_$selectedAgent";
      if (nameI == _currentAbility) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void _toggleAbility(index) {
    setState(() {
      _currentAbility = "${index}_$selectedAgent";
      selectedAbility = _currentAbility;
      setPresentation(index);
    });
  }

  late VideoPlayerController _controller =
      VideoPlayerController.asset("assets/videos/Abilities/$selectedAgent/C_$selectedAgent.mp4");

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/Abilities/$selectedAgent/C_$selectedAgent.mp4")..initialize().then((_){
      _controller.play();
      _controller.setLooping(true);
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackground(),    //VIDEO
        buildGradient(),      //WHITE GRADIENT
        buildDecorations(),   //DECORATION
        buildSwitch(context), //SWITCH OF ATTACK AND DEFENSE
        buildBottom(),        //ABILITIES AND LOCK IN BUTTON
      ],
    );
  }

  Column buildSwitch(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: LiteRollingSwitch(
              value: true,
              width: MediaQuery.of(context).size.width,
              textOn: 'ATTACK',
              textSize: 60,
              textOff: 'DEFENSE',
              colorOn: Colors.black,
              colorOff: kRedMain,
              textOnColor: Colors.white,
              textOffColor: Colors.white,
              iconOn: Icons.lightbulb_outline,
              iconOff: Icons.power_settings_new,
              animationDuration: const Duration(milliseconds: 300),
              onChanged: (bool state) {
                //True = Attack
                //False = Defense
                state ? selectedMap = "Attack" : selectedMap = "Defense";
              },
              onDoubleTap: () {},
              onSwipe: () {},
              onTap: () {},
            ),
          )
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
      margin: const EdgeInsets.symmetric(horizontal: 7.0),
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
                child: Text(
                  'SELECT ABILITY',
                  style: valorantFont(Colors.white, 16),
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
          children: abilitiesMap.map((i) {
            return GestureDetector(
                onTap: () {
                  _toggleAbility(i);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/5,
                  height: 88,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: kPaper,
                      border: Border.all(
                          color: isCurrentAbility(i) ? Colors.black : kGray100,
                          width: 2)),
                  child: Center(
                    child: SizedBox(
                      height: 63,
                      width: 63,
                      child: Image.asset(
                        "assets/images/Abilities/$selectedAgent/${i}_$selectedAgent.png",
                        color: isCurrentAbility(i) ? Colors.black : kGray100,
                      ),
                    ),
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }

  Expanded genExpanded(String image) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 6.5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: /*isCurrentAgent(i) ? Colors.redAccent :*/
                      Colors.black,
                  width: /*isCurrentAgent(i) ? 2.0 :*/ 0.8)),
          child: Image.asset(
            image,
            color: Colors.black.withOpacity(0.5),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Align buildGradient() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 400,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  0.4,
                  1
                ],
                colors: [kPaper, Colors.transparent,])),

      ),
    );
  }

  Stack buildDecorations() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 155.0),
          child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.black, width: 1))),
              )),
        ),
        Container(
          margin: const EdgeInsets.only(right: 300.0, bottom: 130),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 1,
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide(color: Colors.white, width: 1.6))),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 58, bottom: 104),
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


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  late VideoPlayerController _controller = VideoPlayerController.asset("assets/videos/Abilities/Viper/C_Viper.mp4");

  Future<String> getLineups() async{
    var url = Uri.https('pablorius.github.io','pages/Viper/X_Viper.json');
    var response = await http.get(url);
    return response.body;
}


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
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        buildLineups(),
        buildGradient(),
      ],
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

  Column buildLineups() {
    return Column(
      children: [
        _controller.value.isInitialized ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),

        )
            :Container(),
        Text(getLineups().toString())
      ],
    );
  }
}
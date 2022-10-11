import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'globals.dart' as globals;





void main() {
  runApp(const MyApp());
}

class BackgroundWidget extends StatefulWidget{
  const BackgroundWidget({super.key});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>{
  String _currentMap = "assets/images/Main_Wallpaper.png";
  void _toggleBackground(index){
    setState(() {
      if       (index == "assets/images/map_icons/ascent.png")  {_currentMap = "assets/images/maps/ascent.jpg";}
      else if  (index == "assets/images/map_icons/bind.png")    {_currentMap = "assets/images/maps/bind.jpg";}
      else if  (index == "assets/images/map_icons/breeze.png")  {_currentMap = "assets/images/maps/breeze.jpg";}
      else if  (index == "assets/images/map_icons/split.png")   {_currentMap = "assets/images/maps/split.jpg";}
      else if  (index == "assets/images/map_icons/icebox.png")  {_currentMap = "assets/images/maps/icebox.jpg";}
      else if  (index == "assets/images/map_icons/heaven.png")  {_currentMap = "assets/images/maps/heaven.jpg";}
      else if  (index == "assets/images/map_icons/fracture.png"){_currentMap = "assets/images/maps/fracture.jpg";}
      else if  (index == "assets/images/map_icons/pearl.png")   {_currentMap = "assets/images/maps/pearl.jpg";}
    });
  }

  TextStyle tungstenBoldFont(){
    return const TextStyle(
      color: Colors.white,
      fontFamily: "Tungsten",
      fontSize: 24,
    );
  } //Tungsten Bold Font Reusable

  @override
  Widget build(BuildContext context){
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_currentMap), //Background Image
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            alignment: Alignment.bottomLeft,
            child: CarouselSlider(

                items: globals.carouselImages.map((i) {
                  return Builder(
                    builder: (BuildContext context_){
                      return GestureDetector(

                          onTap: (){
                            _toggleBackground(i);
                            globals.selectedMap = i;
                          },
                          child:Container(
                              width: 100,

                              decoration: BoxDecoration(
                                 image: DecorationImage(image:  AssetImage(i), fit: BoxFit.fitWidth),
                                  border: Border.all(color: Colors.white)
                              ),

                              child: Center(
                                child:Text(i.split("/")[3].split(".")[0].toUpperCase(), style: tungstenBoldFont(),),
                              )
                          )

                      );
                    },
                  );}).toList(),
                options: CarouselOptions(
                    viewportFraction: 0.28,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    initialPage: 1,
                )
            )
        )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const ImageIcon(
              AssetImage("assets/images/Icons/back.png"),
              color: Colors.white,
            ),
            onPressed: () => {}
        ),
        title: const Text("Garius#GTF"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const ImageIcon(
                AssetImage("assets/images/Icons/notification.png"),
                color: Colors.white,
              ),
              onPressed: () => {}
          )
        ],
      ),
      body:
        const Center(
          child:
          BackgroundWidget(),
        )
    );
  }
}

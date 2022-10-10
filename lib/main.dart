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
    print(index);
    setState(() {
      if       (index == "assets/images/map_icons/ascent.png")  {_currentMap = "assets/images/maps/ascent.jpg";}
      else if  (index == "assets/images/map_icons/bind.png")    {_currentMap = "assets/images/maps/bind.jpg";}
      else if  (index == "assets/images/map_icons/breeze.png")  {_currentMap = "assets/images/maps/breeze.png";}
      else if  (index == "assets/images/map_icons/split.png")   {_currentMap = "assets/images/maps/split.jpg";}
      else if  (index == "assets/images/map_icons/icebox.png")  {_currentMap = "assets/images/maps/icebox.jpg";}
      else if  (index == "assets/images/map_icons/heaven.png")  {_currentMap = "assets/images/maps/heaven.jpg";}
      else if  (index == "assets/images/map_icons/fracture.png"){_currentMap = "assets/images/maps/fracture.jpg";}
      else if  (index == "assets/images/map_icons/pearl.png")   {_currentMap = "assets/images/maps/pearl.jpg";}
    });
  }
  @override
  Widget build(BuildContext context){
    print("Building: $_currentMap");
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_currentMap), //Background Image
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            alignment: Alignment.bottomCenter,
            child: CarouselSlider(
                items: globals.carouselImages.map((i) {
                  return Builder(
                    builder: (BuildContext context_){
                      return GestureDetector(
                          onTap: (){
                            print("Cambiando Fondo");
                            _toggleBackground(i);
                          },
                          child:Container(
                            width: MediaQuery.of(context_).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(i))
                            ),
                          )

                      );
                    },
                  );}).toList(),
                options: CarouselOptions(
                    viewportFraction: 0.25,
                    height: 300,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    initialPage: 1
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
        title: const Text("Valorant App"),
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

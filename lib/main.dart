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

  bool isCurrentMap(index){
    if (_currentMap != "assets/images/Main_Wallpaper.png"){
      String realIndex = index.split("/")[3].split(".")[0];
      String realCurrentMap = _currentMap.split("/")[3].split(".")[0];
      print("Index $realIndex");
      print("Current map: $realCurrentMap");
      if (realIndex == realCurrentMap){return true;}else{return false;}
    }
    return false;
  }

  CarouselSlider mapSlider(){
    return CarouselSlider(

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
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: isCurrentMap(i) ? Colors.redAccent : Colors.transparent, width: 2.0)
                      ),

                      child: Image.asset(i,fit: BoxFit.cover,)
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
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_currentMap), //Background Image
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(

                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 10.0),
                child: mapSlider()
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
      debugShowCheckedModeBanner: false,
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
        const BackgroundWidget()
    );
  }
}

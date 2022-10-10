import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'globals.dart' as globals;





void main() {
  runApp(const MyApp());
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

  final carouselImages = [
    "assets/images/map_icons/ascent.png",
    "assets/images/map_icons/bind.png",
    "assets/images/map_icons/breeze.png",
    "assets/images/map_icons/fracture.png",
    "assets/images/map_icons/heaven.png",
    "assets/images/map_icons/icebox.png",
    "assets/images/map_icons/pearl.png",
    "assets/images/map_icons/split.png",
  ];

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
      Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(getCurrentBackground()), //Background Image
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              alignment: Alignment.bottomCenter,
              child: CarouselSlider(
                  items: carouselImages.map((i) {
                    return Builder(
                      builder: (BuildContext context){
                        assert(debugCheckHasMaterial(context));
                        return InkWell(
                            onTap: (){
                              print("Cambiando Fondo");
                              globals.currentBackground = i;
                            },
                            child:Container(
                              width: MediaQuery.of(context).size.width,
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
      ),
    );
  }

  String getCurrentBackground() {
    if (globals.currentBackground == "assets/images/map_icons/ascent.png"){
      return "assets/images/maps/ascent.jpg";
    }else{
      return "assets/images/Main_Wallpaper.png";
    }
  }
}

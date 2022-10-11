import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;


  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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
          /*BackgroundWidget(),*/
        )
    );
  }
}
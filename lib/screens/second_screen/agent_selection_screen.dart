import 'package:flutter/material.dart';
import 'components/body.dart';
import '../home/home_screen.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});


  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const ImageIcon(
              AssetImage("assets/icons/back.png"),
              color: Colors.white,
            ),
            onPressed: () => {Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()))}
        ),
        title: const Text("Agent Selection"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const ImageIcon(
                AssetImage("assets/icons/notification.png"),
                color: Colors.white,
              ),
              onPressed: () => {}
          )
        ],
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}


import 'package:flutter/material.dart';
import 'components/body.dart';

class AbilitiesScreen extends StatefulWidget {
  const AbilitiesScreen({super.key});


  @override
  State<AbilitiesScreen> createState() => _AbilitiesScreenState();
}

class _AbilitiesScreenState extends State<AbilitiesScreen> {

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
                context, MaterialPageRoute(builder: (context) => const AbilitiesScreen()))}
        ),
        title: const Text("Lineups"),
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


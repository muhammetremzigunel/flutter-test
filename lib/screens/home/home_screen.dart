import 'package:flutter/material.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeAppBarTitle(),
      ),
      body: const HomeBody(),
    );
  }
}

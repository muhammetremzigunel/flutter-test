import 'package:flutter/material.dart';
import 'home_view_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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

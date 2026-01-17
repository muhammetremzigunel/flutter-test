import 'package:flutter/material.dart';
import '../../constant/string_constant.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(StringConstants.homeTitle);
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(StringConstants.homeTitle),
    );
  }
}

import 'package:flutter/material.dart';

class AppBarLayout extends StatelessWidget {
  final String titie;
  final Widget child;

  const AppBarLayout({
    Key? key,
    required this.titie,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titie),
      ),
      body: child,
    );
  }
}

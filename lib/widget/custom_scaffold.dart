import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  
  const CustomScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          child,
          Positioned(
            top: 50,
            left: 20,
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
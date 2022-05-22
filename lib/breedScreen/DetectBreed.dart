import 'package:flutter/material.dart';

class DetectBreed extends StatelessWidget {
  static const String routeName = "DetectBreed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breed'),
      ),
      body: Container(
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'images/DetectBreed.png',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'images/pattern2.png',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

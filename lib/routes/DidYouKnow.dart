// ignore: file_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:petshelt/routes/bird.dart';
import 'package:petshelt/routes/cat.dart';
import 'package:petshelt/routes/dog.dart';
import 'package:petshelt/routes/fish.dart';
import 'package:petshelt/routes/hamster.dart';
import 'package:petshelt/routes/turtle.dart';
import 'PetType.dart';

class DidYouKnow extends StatelessWidget {
  static const String routeName = 'DidYouKnow';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(118, 189, 178, 1),
              title: const Text(
                'Did You Know ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Cat()));
                      },
                      child: PetType('CAT', 'images/catInfo.jpg')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Dog()));
                      },
                      child: PetType('DOG', 'images/dogInfo.jpg')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Turtle()));
                      },
                      child: PetType('TURTLE', 'images/turtInfo.jpg')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Hamster()));
                      },
                      child: PetType(
                          'HAMSTER', 'images/hamsterInfo.jpg')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Fish()));
                      },
                      child: PetType('FISH', 'images/fishInfo.jpg')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Bird()));
                      },
                      child: PetType('BIRD', 'images/birdInfo.jpg'))
                ],
              ),
            )));
  }
}

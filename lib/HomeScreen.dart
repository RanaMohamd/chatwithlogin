import 'package:flutter/material.dart';
import 'package:petshelt/breedScreen/Breed_Screen.dart';
import 'package:petshelt/info_shelters_screens/shelters_ui.dart';
import 'package:petshelt/map/mapScreen.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);
  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 57,
                  icon: const Icon(Icons.home),
                  color: const Color(0xFF6EC9B1),
                  onPressed: () {
                    Navigator.pushNamed(context, sheltersScreen.routeName);
                  },
                ),
                IconButton(
                  iconSize: 57,
                  icon: Image.asset('images/location_paw.png'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, mapScreen.routeName);
                  },
                ),
                IconButton(
                  iconSize: 57,
                  icon: Image.asset('images/breeds.png'),
                  color: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../Grid View/grid_screen.dart';
import '../Instagram UI/View/home_screen.dart';
import '../List View Users Location/View/location.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/1.jpg"), fit: BoxFit.fill),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          button("User Locations", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LocationScreen()));
          }),
          button("Grid View", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ImageGridScreen()));
          }),
          button("Instagram UI", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }),
        ],
      ),
    );
  }

  /* Elevated Button Design */

  Widget button(String name, VoidCallback callback) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          maximumSize: const Size(250, 50),
        ),
        onPressed: callback,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

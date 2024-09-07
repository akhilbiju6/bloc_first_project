import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery App"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
      height:size.height,
      width: size.height,
           ),
    );
  }
}
import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 19 , 31, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(24, 19 , 31, 1),
        shadowColor: null,
        foregroundColor: Color.fromRGBO(237, 237 , 227, 1),
      ),
      body:Center(
        child: Column(children: [
          Image.asset('assets/images/team.png', height: MediaQuery.of(context).size.height*0.35,),
          const Text("Integrantres", 
              style: TextStyle(
                color: Color.fromRGBO(237, 237 , 227, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 20,),
          const Text("Isabela Marques RM86386", 
              style: TextStyle(
                color: Color.fromRGBO(237, 237 , 227, 1),
                fontSize:24,
              ),),
              const SizedBox(height: 10,),
          const Text("Daniele Licinio RM85715", 
              style: TextStyle(
                color: Color.fromRGBO(237, 237 , 227, 1),
                fontSize: 24,
              ),),
              const SizedBox(height: 20,),
          const Text("3SIR", 
              style: TextStyle(
                color: Color.fromRGBO(237, 237 , 227, 1),
                fontSize:24,
              ),),
        ],),
      )

    );
  }
}
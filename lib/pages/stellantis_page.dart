import 'package:flutter/material.dart';

class StellantisPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 19 , 31, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(24, 19 , 31, 1),
        shadowColor: null,
        foregroundColor: Color.fromRGBO(237, 237 , 227, 1),
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                                left: 30, top: 5, right: 30, bottom: 30),
            child: Column(children: [
              Image.asset('assets/images/stellantis.png', height: MediaQuery.of(context).size.height*0.16,),
              const SizedBox(height: 10,),
              const Text("Stellantis é um grupo automotivo franco-ítalo-americano multinacional, formado a partir da união da montadora ítalo-americana Fiat Chrysler Automobiles com a montadora francesa PSA Group. A palavra Stellantis tem suas raízes no verbo latino stello que significa \"iluminar com estrelas\". Atualmente, o grupo Stellantis reúne 20 empresas automotivas e é a 4ª maior fabricante de carros do mundo.",
                  style: TextStyle(
                    color: Color.fromRGBO(237, 237 , 227, 1),
                    fontSize:16,
                  ),),
                  const SizedBox(height: 20,),
            ],),
          ),
        ),
      )

    );
  }
}
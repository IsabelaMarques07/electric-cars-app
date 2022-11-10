import 'package:flutter/material.dart';
import 'package:stellantis/pages/stellantis_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right:20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Home", 
            style: TextStyle(
              color: const Color.fromRGBO(24, 19 , 31, 1),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height:10),
            const Text("Aproveite as funcionalidades do app e tire o maior proveito do seu veículo.",
              style: TextStyle(
                color: const Color.fromRGBO(24, 19 , 31, 1),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),),
              const SizedBox(height:10),
              Row(
                  children: [
                    Card(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20, right:20, bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                children:const [
                                  Text("58",
                                   style: TextStyle(
                                    color: const Color.fromRGBO(24, 19 , 31, 1),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  Text("%", 
                                    style: TextStyle(
                                      color: Color.fromRGBO(24, 19, 31, 0.5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),)
                                ],
                              ),
                              Text("230Km"),
                              const SizedBox(height:10),
                              Image.asset('assets/images/battery.png', 
                                height: MediaQuery.of(context).size.height*0.07,
                                )
                            ]
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        
                        height: MediaQuery.of(context).size.height*0.25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8, right:8, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Conectividade", 
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("Controle \nfuncionalidades\ndo seu carro\napenas com o\napp",
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                  ),
                              Image.asset('assets/images/conectivity.png', 
                                height: MediaQuery.of(context).size.height*0.07,
                                )
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                    Card(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8, right:8, bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Eletropostos mais \npróximos", 
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  const SizedBox(height: 6,),
                                  Text("Encontre os \neletropostos mais \npertos de você",
                                      style: TextStyle(
                                        fontSize: 16
                                      ),
                                      ),
                                ],
                              ),
                              const SizedBox(width: 12,),
                              Image.asset('assets/images/map.png', 
                                height: MediaQuery.of(context).size.height*0.18,
                                )
                            ]
                          ),
                        ),
                      ),
                    ),
            ElevatedButton(
                      onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StellantisPage(),
                                ),
                              );
                      },
                      child: const Text('Sobre a empresa'),
                    ),
          ],
        ),
      ),
    );
  }
}
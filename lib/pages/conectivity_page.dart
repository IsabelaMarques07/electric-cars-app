import 'package:flutter/material.dart';

class ConectivityPage extends StatefulWidget {
  const ConectivityPage({Key? key}) : super(key: key);

  @override
  State<ConectivityPage> createState() => _ConectivityPageState();
}

class _ConectivityPageState extends State<ConectivityPage> {
  bool motor = false;
  bool arCondicionado = false;
  bool farol = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Conectividade",
            style: TextStyle(
              color: const Color.fromRGBO(24, 19, 31, 1),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/images/carExample.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 0),
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 20),
              height: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                )
              ]),
              child: Column(
                children: [
                  Row(children: [
                    Column(
                      children: [
                        Text(
                          "58%",
                          style: TextStyle(
                            color: Color.fromRGBO(24, 19, 31, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "230Km",
                          style: TextStyle(
                            color: Color.fromRGBO(24, 19, 31, 1),
                            fontSize: 20,
                          ),
                        ),
                        Image.asset(
                          'assets/images/battery.png',
                          height: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        Text(
                          "28lib",
                          style: TextStyle(
                            color: Color.fromRGBO(24, 19, 31, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Bom",
                          style: TextStyle(
                            color: Color.fromARGB(255, 7, 44, 10),
                            fontSize: 20,
                          ),
                        ),
                        Image.asset(
                          'assets/images/tire.png',
                          height: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        Text(
                          "350Km",
                          style: TextStyle(
                            color: Color.fromRGBO(24, 19, 31, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "percorridos",
                          style: TextStyle(
                            color: Color.fromRGBO(24, 19, 31, 1),
                            fontSize: 20,
                          ),
                        ),
                        Image.asset(
                          'assets/images/km.png',
                          height: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ],
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ligar motor",
                        style: TextStyle(
                          color: Color.fromRGBO(24, 19, 31, 1),
                          fontSize: 24,
                        ),
                      ),
                      Switch(
                        value: motor,
                        activeColor: Color.fromARGB(255, 7, 110, 21),
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            motor = value;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ligar ar-condicionado",
                        style: TextStyle(
                          color: Color.fromRGBO(24, 19, 31, 1),
                          fontSize: 24,
                        ),
                      ),
                      Switch(
                        value: arCondicionado,
                        activeColor: Color.fromARGB(255, 7, 110, 21),
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            arCondicionado = value;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ligar farol",
                        style: TextStyle(
                          color: Color.fromRGBO(24, 19, 31, 1),
                          fontSize: 24,
                        ),
                      ),
                      Switch(
                        value: farol,
                        activeColor: Color.fromARGB(255, 7, 110, 21),
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            farol = value;
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}

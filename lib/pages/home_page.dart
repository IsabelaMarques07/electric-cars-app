import 'package:flutter/material.dart';
import 'package:stellantis/pages/book_page.dart';
import 'package:stellantis/pages/conectivity_page.dart';
import 'package:stellantis/pages/electroposts_page.dart';
import 'package:stellantis/pages/initial_page.dart';
import 'package:stellantis/pages/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237 , 227, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 237 , 227, 1),
        shadowColor: null,
        foregroundColor:const Color.fromRGBO(24, 19 , 31, 1),
      ),
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: [
          InitialPage(),
          BookPage(),
          ElectropostsPage(),
          ConectivityPage(),
          UserPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        backgroundColor: const Color.fromRGBO(24, 19 , 31, 1),
        fixedColor: const Color.fromRGBO(254, 76 , 81, 1),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.departure_board), label: 'Reservar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_gas_station), label: 'Eletropostos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental), label: 'Conectivity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'User')
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stellantis/pages/book_page.dart';
import 'package:stellantis/pages/conectivity_page.dart';
import 'package:stellantis/pages/electroposts_page.dart';
import 'package:stellantis/pages/initial_page.dart';
import 'package:stellantis/pages/login_page.dart';
import 'package:stellantis/pages/stellantis_page.dart';
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
              icon: Icon(Icons.pie_chart), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'Reservar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'Eletropostos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'Conectivity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user), label: 'User')
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
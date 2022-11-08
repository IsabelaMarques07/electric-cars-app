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
      child: ElevatedButton(
                onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StellantisPage(),
                          ),
                        );
                },
                child: const Text('?'),
              ),
    );
  }
}
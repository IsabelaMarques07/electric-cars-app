import 'package:flutter/material.dart';

class ElectropostsPage extends StatefulWidget {
  const ElectropostsPage({Key? key}) : super(key: key);

  @override
  State<ElectropostsPage> createState() => _ElectropostsPageState();
}

class _ElectropostsPageState extends State<ElectropostsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Electroposts'),
    );
  }
}
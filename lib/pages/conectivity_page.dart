import 'package:flutter/material.dart';

class ConectivityPage extends StatefulWidget {
  const ConectivityPage({Key? key}) : super(key: key);

  @override
  State<ConectivityPage> createState() => _ConectivityPageState();
}

class _ConectivityPageState extends State<ConectivityPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Conectivity'),
    );
  }
}
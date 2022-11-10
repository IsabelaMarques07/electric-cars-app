import 'package:flutter/material.dart';
import 'package:stellantis/pages/home_page.dart';
import 'package:stellantis/pages/team_page.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
                onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                },
                child: const Text('Loginn'),
              ),
            ElevatedButton(
              onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamPage(),
                      ),
                    );
                  },
                  child: const Text('Sobre a equipe'),
              ),
        ],
      ),
    );
  }
}

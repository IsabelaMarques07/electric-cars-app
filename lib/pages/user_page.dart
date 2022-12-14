import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:stellantis/models/reservation.dart';
import 'package:stellantis/pages/home_page.dart';
import 'package:stellantis/pages/team_page.dart';
import 'package:stellantis/repository/reservation_repository.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _someController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor:  Color.fromRGBO(237, 237 , 227, 1),
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(237, 237 , 227, 1),
        shadowColor: Colors.transparent,
      ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                              left: 30, top: 10, right: 30, bottom: 30),
              child: Column(
                children: [
              const Text("Conta", 
              style: TextStyle(
                color: const Color.fromRGBO(24, 19 , 31, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
                  const SizedBox(height: 20,),
                  Image.asset('assets/images/user.png', 
                  height: MediaQuery.of(context).size.height*0.2,),
                  const SizedBox(height: 20,),
                  _buildNome(),
                  const SizedBox(height: 20,),
                  _buildEmail(),
                  const SizedBox(height: 20,),
                  _buildSenha(),
                 const SizedBox(height: 20,),
                  _buildButton(),
                ],
              ),
              )
          ),
        ),
      ),
    );
  }

    TextFormField _buildEmail() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Informe o email',
        labelText: 'Email',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
      TextFormField _buildNome() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Informe o nome',
        labelText: 'Nome',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.verified_user),
      ),
    );
  }
      TextFormField _buildSenha() {
    return TextFormField(
      controller: _senhaController,
      decoration: const InputDecoration(
        hintText: 'Informe a senha',
        labelText: 'Senha',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.password),
      ),
    );
  }


  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Salvar'),
        ),
        onPressed: () async {
          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
          );
        },
      ),
    );
  }

}
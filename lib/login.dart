
import 'package:flutter/material.dart';
import 'package:foodapp/controller/login_controller.dart';
import 'package:foodapp/homepage.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  LoginController controller = LoginController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding:  const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding:  const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
               const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration:  const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:  const InputDecoration(
                        labelText: 'Senha',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                          //Navigator.pushReplacementNamed(context, '/home');
                          logar();
                      },
                      child:  const Text('Entrar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                    ),
                     const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastrar');
                      },
                      child:  const Text('Cadastrar'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// ignore: non_ant_identifier_names
logar() async {
    var retorno = await controller.logar(_emailController.text, _passwordController.text);
    if (retorno != 0) {
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  users: retorno,
                )),
      );
    } else {
      return showModalBottomSheet<void>(
        context: context as BuildContext,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Usuáriio/Senha invalidos'),
                  ElevatedButton(
                    child: Text('Fechar'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
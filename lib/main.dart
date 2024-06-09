import 'package:flutter/material.dart';
import 'package:foodapp/homepage.dart';
import 'package:foodapp/login.dart';
import 'package:foodapp/cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        '/cadastrar': (context) => CadastroPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
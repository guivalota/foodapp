import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedProduct = '';
  String _description = '';
  int _quantity = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery App'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Bem-vindo ao Food Delivery App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedProduct,
                      onChanged: (value) {
                        setState(() {
                          _selectedProduct = value!;
                        });
                      },
                      items: [
                        'Pizza',
                        'Lanche',
                        'Batata',
                      ].map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor adicione uma descrição';
                        }
                        return null;
                      },
                      onSaved: (value) => _description = value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Quantidade',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor adicione uma quantidade';
                        }
                        return null;
                      },
                      onSaved: (value) => _quantity = int.parse(value!),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Produto adicionado ao carrinho!');
                  }
                },
                child: const Text('Adicionar ao Carrinho'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
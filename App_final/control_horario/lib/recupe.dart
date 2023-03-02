import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Unique Systems'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
            "Recuperar contraseña".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
              fontSize: 20
              ),
              ),
              _textFieldEmail(),
              SizedBox(height: 15.0,),
              
            ],
          ) 
        ),
      ),
    );
  }
}

Widget _textFieldEmail() {
  return Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 30.0,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    // ignore: prefer_const_constructors
    child:TextField(
      decoration:const InputDecoration(
      prefixIcon: Icon(Icons.email_outlined),
      labelText: 'Correo Electronico',
      hintText: 'example@test.com',
      ), 
      onChanged: (value){},
    ),
  );
}


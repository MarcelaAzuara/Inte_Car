import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      title: "Unique Systems",
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  void saludar() {
    print("Hola");
  }

  void recuperarContrasena() {
    // Implementa aquí la lógica para recuperar la contraseña
    print("Recuperar contraseña");
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                height: 130,
              ),
            ),
            const Text(
              "Unique Systems",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  labelText: 'Correo',
                ),
              ),
            ),
            const SizedBox(
              width: 200,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    labelText: 'Contraseña'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: saludar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Iniciar Sesion')),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: recuperarContrasena,
              child: const Text('¿Olvidaste tu contraseña?'),
            ),
          ]),
    );
  }
}

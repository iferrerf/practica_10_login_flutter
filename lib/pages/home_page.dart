import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key, required this.correo, required this.password});

  final String correo;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const Text("Usuario registrado en la app",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(correo, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                const Text("Contraseña del usuario",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(password, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}

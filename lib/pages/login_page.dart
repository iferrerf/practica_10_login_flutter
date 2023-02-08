import 'package:flutter/material.dart';
import 'package:practica_10_login_flutter/pages/home_page.dart';

import '../widget/custom_input_widget.dart';

class Login_page extends StatelessWidget {
  const Login_page({super.key});

  void mostrarAlertaAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            elevation: 5,
            title: const Text('Datos incorrectos'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('No has rellenado los campos correctamente'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textCorreo = TextEditingController(text: "");
    TextEditingController textPassword = TextEditingController(text: "");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              const FlutterLogo(size: 130),
              Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomInputWidget(
                      labelText: 'Correo',
                      icon: Icons.email_outlined,
                      teclado: TextInputType.emailAddress,
                      textControler: textCorreo,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomInputWidget(
                      labelText: 'Contraseña',
                      icon: Icons.lock_open,
                      obscureText: true,
                      textControler: textPassword,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Botón para enviar Formulario
                    ElevatedButton(
                      onPressed: () {
                        //Quiero que desaparezca el teclado
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (textCorreo.text.length >= 6 ||
                            textPassword.text.length >= 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_page(
                                      correo: textCorreo.text,
                                      password: textPassword.text,
                                    )),
                            (route) => false,
                          );
                        } else {
                          mostrarAlertaAndroid(context);
                        }
                      },
                      child: const Center(
                        child: Text('Guardar'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

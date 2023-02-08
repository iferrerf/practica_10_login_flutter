import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final TextInputType? teclado;
  final bool obscureText;
  final TextEditingController? textControler;

  const CustomInputWidget({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.teclado,
    this.obscureText = false,
    this.textControler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textControler,
      keyboardType: teclado,
      obscureText: obscureText,
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        icon: icon == null ? null : Icon(icon),
        iconColor: Colors.blueAccent,
      ),
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 6 ? 'Minimo 6 caracteres' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

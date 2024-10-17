import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{
  final String texto;

  final void Function() onSelect;

  Resposta (this.texto, this.onSelect);        ///metódo construtor.
  Widget build(BuildContext context){
    return Container(
      width: 80,
      child: ElevatedButton(
        onPressed: onSelect,
        child: Text(texto),
      ),
    );

  }
}
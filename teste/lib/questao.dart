import 'package:flutter/material.dart';

class Questao extends StatelessWidget{
   final String texto;

   Questao (this.texto);        ///metódo construtor (msm nome da class).
  Widget build(BuildContext context){
    return Text (texto);
  }
}
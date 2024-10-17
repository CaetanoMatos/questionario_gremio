import 'package:flutter/material.dart';
class Congrats extends StatelessWidget {
  final int pontos;
  String classificacao='';
  Congrats(this.pontos);

     Widget build(BuildContext context){
       if (pontos>=0 && pontos>=30) {
         classificacao = 'Bressan, desastre total.';
       }
        if (pontos>=30 && pontos>=60) {
         classificacao = 'Bruno Cortez,  até vai, mas tá mal.';
       }
        if (pontos>=60 && pontos>=80) {
         classificacao = 'Kannemann, bem demais!';
       }
        if (pontos>=80 && pontos>=100) {
         classificacao = 'Geromito, ídolo máximo!';
       }

       return Container(
         child: Column(
           children: [
             Text('CLASSIFICAÇÃO: $classificacao\n Sua pontuação foi de $pontos',
             style: TextStyle(fontSize: 40)),
           ],
         ),
       );
     }



  }
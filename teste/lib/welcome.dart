import 'package:flutter/material.dart';
class Welcome extends StatelessWidget {
  //final String texto2;
  Welcome(this.onSelect);
  final void Function() onSelect;
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          Text('Olá, seja bem vindo, selecione abaixo o nível que deseja jogar:',
              style: TextStyle(fontSize: 40)),
        ElevatedButton(
            onPressed: onSelect,
            child: Text('Nível Fácil'),
        ),

          ElevatedButton(
      onPressed: onSelect,
      child: Text('Nível Fácil'),
      ),

          ElevatedButton(
            onPressed: onSelect,
            child: Text('Nível Fácil'),
          ),
        ],
      ),
    );

  }


}
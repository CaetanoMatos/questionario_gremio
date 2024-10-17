import 'package:flutter/material.dart';
import 'package:teste/questao.dart';
import 'package:teste/resposta.dart';
import 'package:teste/congrats.dart';
import 'package:teste/welcome.dart';

///dart so funciona para android
///flutter serve tanto para IOS quanto para ANDROID (mult-platafform)

main(){
  runApp(new QuizApp());

}
/// a funcao busca por indice e exibe as perguntas a partir do indice 0 ///

class PerguntaAppState extends State <QuizApp>{

  var perguntaResp=0; ///pergunta que foi selecionada
  var pontosTotal = 0; /// conta os pontos
  var respDif = false;
  final perguntas=[
    {
      'texto':'Qual o ano de fundação do clube?',
      'resposta': [
        {'texto':'1904', 'pontos': 0} ,       ///antes so tinha string agr virou uma list de objetos  devido a: {}
        {'texto':'1903', 'pontos': 10} ,
        {'texto':'1905', 'pontos': 0}
      ]
    },

    {
      'texto':'Atualmente, quantas taça Copa do Brasil o Grêmio tem?',
      'resposta': [
        {'texto':'Quatro', 'pontos': 0} ,
        {'texto':'Seis', 'pontos': 0} ,
        {'texto':'Cinco', 'pontos': 10}
      ]
    },

    {
      'texto':'Contra qual time foi A Batalha dos Aflitos?',
      'resposta': [
        {'texto':'America', 'pontos': 0} ,
        {'texto':'Sabugy', 'pontos': 0} ,
        {'texto':'Náutico', 'pontos': 10}   ///''texto'' e ''pontos'' nao podem mudar pq serao comuns a todas as questions
      ]
    },
    {
      'texto':'Qual o ano placar do primeiro GRE-NAL?',
      'resposta': [
        {'texto':'10 X 0', 'pontos': 10} ,
        {'texto':'5x1', 'pontos': 0} ,
        {'texto':'4x0', 'pontos': 0}
      ]
    },
    {
      'texto':'Contra que equipe o Grêmio jogou a final da CDB de 2016?',
      'resposta': [
        {'texto':'Atlético Mineiro', 'pontos': 10} ,
        {'texto':'Atlético Paranaese', 'pontos': 0} ,
        {'texto':'Atlético Nacional', 'pontos': 0}
      ]
    },

    {
      'texto':'Qual o jogador que tem estátua no clube? ',
      'resposta': [
        {'texto':'Tarcisio Flecha-Negra', 'pontos': 0} ,
        {'texto':'Renato Gaúcho', 'pontos': 10} ,
        {'texto':'Roger Machado', 'pontos': 0}
      ]
    },
    {
      'texto':'Atualmente, quantas taça Libertadores da América o Grêmio tem?',
      'resposta': [
        {'texto':'2', 'pontos': 0} ,
        {'texto':'1', 'pontos': 0} ,
        {'texto':'3', 'pontos': 10}
      ]
    },

    {
      'texto':'Qual a cidade de fundação?',
      'resposta': [
        {'texto':'Porto Alegre', 'pontos': 0} ,
        {'texto':'Canoas', 'pontos': 0} ,
        {'texto':'Viamão', 'pontos': 10}
      ]
    },

    {
      'texto':'Quantas vezes o clube foi rebaixado?(Essa dói)',
      'resposta': [
        {'texto':'Duas', 'pontos': 0} ,
        {'texto':'Três', 'pontos': 10} ,
        {'texto':'Nenhuma', 'pontos': 0}
      ]
    },
    {
      'texto':'Qual divisão o clube está atualmente?(2022)',
      'resposta': [
        {'texto':'Série A', 'pontos': 0} ,
        {'texto':'Série B', 'pontos': 10} ,
        {'texto':'Série C', 'pontos': 0}
      ]
    },



  ];

  void responder(int pontos){  ///quando chamar a funcao acontece isso:
    if(temperguntaResp){
      setState(() {
        perguntaResp++;
        pontosTotal += pontos;
    });
  }
}

  bool get temperguntaResp{
    return perguntaResp < perguntas.length;
}



  Widget build(BuildContext context){

    List<Map<String, Object>> respostas= temperguntaResp
     ? perguntas[perguntaResp].cast()['resposta'] ///se for verdade
     : [];   ///se for falso

    ///ao inves de usar aquele FOR vamos usar essa funcao MAP

                      //List<Widget> respostas=[];
                      //for (String txtResp in perguntas[perguntaResp].cast()['resposta']){
                      // respostas.add(Resposta(txtResp, responder));
                      //}


    return MaterialApp( /// é aqui que retorna os componentes visuais da tela
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Grêmio'),
        ),
        body: respDif
            ?
        temperguntaResp ///se a função for verdadeira ele exibe a Column

            ? Column(
          children: [
            Text('Quiz'),
            Questao(perguntas[perguntaResp]['texto'].toString()),
            ...respostas
                .map((resp) => Resposta(resp['texto'].toString(), () => responder(int.parse(resp['pontos'].toString()))))
                .toList() ///toList serve para converter um monte de string para lista
          ],
        ) ///caso contrario=
            : Congrats(pontosTotal)
            :
            Welcome(() { })

      ),
    );
  }
}


class QuizApp extends StatefulWidget{
 PerguntaAppState createState(){
   return PerguntaAppState();
 }
}



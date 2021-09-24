

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarefas_banco/database/database.dart';
import 'package:tarefas_banco/model/atividade.dart';

class PaginaTarefas extends StatelessWidget{
  PaginaTarefas({Key? key, required this.bd}) : super(key: key);
  final BancoDeDadosApp bd;
  
  final _tituloController = new TextEditingController(text: '');
  final _textoController = new TextEditingController(text: '');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          onPressed: (){
            if(_tituloController.text.isNotEmpty &&
            _textoController.text.isNotEmpty){
              bd.atividadeRepositoryDAO.insertItem(new Atividade(
                titulo: _tituloController.text,
                texto: _textoController.text,
                quandoFoiCriado: DateTime.now().toUtc().toString(),
              )
              );

              Navigator.pop(context, true);
            }


          },
        child: Icon(Icons.save) ,
          ),
      appBar: new AppBar(
        title: new TextField( // text field
          controller: _tituloController,
          cursorColor: Colors.white70,
          showCursor: true,
          style:
          Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            hintText: "Título",
            border: InputBorder.none
          ),
        ),
        leading: IconButton( //icone de voltar
          icon: Icon(Icons.chevron_left),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget> [ //botao lixeira
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: new Column(
          children: <Widget> [
            new TextField(
              controller: _textoController,
              decoration:
              InputDecoration(
                hintText: "Digite anotação"
              ),
                maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }

}
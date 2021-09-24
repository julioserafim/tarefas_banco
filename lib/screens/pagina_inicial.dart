
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarefas_banco/database/database.dart';
import 'package:tarefas_banco/model/atividade.dart';
import 'package:tarefas_banco/screens/paginas_tarefas.dart';

class PaginaInicial extends StatefulWidget{
  const PaginaInicial({Key? key, required this.bd}) : super(key: key);
  final BancoDeDadosApp bd;

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          onPressed: () async{
            var resultado = await Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return PaginaTarefas(bd:widget.bd);
                },
                ),

            );
            if(resultado){
              setState(() {
              });
            }

          },
        child: Icon(Icons.add) ,
          ),
      appBar: new AppBar(
        title: Text("Minhas anotações"),
      ),

      body: FutureBuilder<List<Atividade>>(
        future: widget.bd.atividadeRepositoryDAO.getAll(),
        builder: (context, snapshot){
          return snapshot.hasData ?
              ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].titulo),
                      subtitle: Text(snapshot.data![index].texto),
                    ),
                  );
                },
              )
              : Center(
            child: Text("Sem dados cadastrados"),
          );
        },
      ),
    );
  }
}
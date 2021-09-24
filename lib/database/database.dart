
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:tarefas_banco/model/atividade.dart';
import 'package:tarefas_banco/repository/atividade_respository.dart';


part 'database.g.dart';

@Database(version: 1, entities: [Atividade])
abstract class BancoDeDadosApp extends FloorDatabase{

  AtividadeRepositoryDAO get atividadeRepositoryDAO;

}
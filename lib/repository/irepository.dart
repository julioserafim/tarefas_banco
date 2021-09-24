

import 'package:floor/floor.dart';
import 'package:tarefas_banco/model/entidade_base.dart';

abstract class IRepositoryDAO<Model extends EntidadeBase>{

  @insert
  Future<int> insertItem(Model item);

  @update
  Future<int> updateItem(Model item);

  @delete
  Future<int> deleteItem(Model item);

}
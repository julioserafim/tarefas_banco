
import 'package:floor/floor.dart';
import 'package:tarefas_banco/model/atividade.dart';
import 'package:tarefas_banco/repository/irepository.dart';

@dao
abstract class AtividadeRepositoryDAO extends IRepositoryDAO<Atividade>{

  @Query('SELECT * Atividade WHERE codigo = :codigo')
  Future<Atividade?> getById(int codigo);

  @Query('SELECT * FROM Atividade')
  Future<List<Atividade>> getAll();


}

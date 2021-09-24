
import 'package:floor/floor.dart';
import 'package:tarefas_banco/model/entidade_base.dart';

@entity
class Atividade extends EntidadeBase {

  Atividade(
      {int? codigo, required String quandoFoiCriado, required this.titulo, required this.texto})
      : super(codigo, quandoFoiCriado);

  final String titulo;
  final String texto;

}
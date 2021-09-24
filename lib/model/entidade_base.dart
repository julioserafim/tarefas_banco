
import 'package:floor/floor.dart';

class EntidadeBase{

  EntidadeBase(this.codigo, this.quandoFoiCriado);

  @PrimaryKey(autoGenerate: true)
  final int? codigo;

  final String quandoFoiCriado;
}
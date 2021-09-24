import 'package:flutter/material.dart';
import 'package:tarefas_banco/database/database.dart';
import 'package:tarefas_banco/screens/pagina_inicial.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized(); //garanto que os widgets ini.
  runApp(MyApp(
    bd: await $FloorBancoDeDadosApp.
    databaseBuilder('app_database_at.db').build(),
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key, required this.bd}) : super(key: key);
  final BancoDeDadosApp bd;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',

      home: PaginaInicial(bd:bd),
    );
  }
}


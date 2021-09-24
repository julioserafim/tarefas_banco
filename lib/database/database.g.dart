// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorBancoDeDadosApp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BancoDeDadosAppBuilder databaseBuilder(String name) =>
      _$BancoDeDadosAppBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BancoDeDadosAppBuilder inMemoryDatabaseBuilder() =>
      _$BancoDeDadosAppBuilder(null);
}

class _$BancoDeDadosAppBuilder {
  _$BancoDeDadosAppBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BancoDeDadosAppBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BancoDeDadosAppBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BancoDeDadosApp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BancoDeDadosApp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BancoDeDadosApp extends BancoDeDadosApp {
  _$BancoDeDadosApp([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AtividadeRepositoryDAO? _atividadeRepositoryDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Atividade` (`titulo` TEXT NOT NULL, `texto` TEXT NOT NULL, `codigo` INTEGER PRIMARY KEY AUTOINCREMENT, `quandoFoiCriado` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AtividadeRepositoryDAO get atividadeRepositoryDAO {
    return _atividadeRepositoryDAOInstance ??=
        _$AtividadeRepositoryDAO(database, changeListener);
  }
}

class _$AtividadeRepositoryDAO extends AtividadeRepositoryDAO {
  _$AtividadeRepositoryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _atividadeInsertionAdapter = InsertionAdapter(
            database,
            'Atividade',
            (Atividade item) => <String, Object?>{
                  'titulo': item.titulo,
                  'texto': item.texto,
                  'codigo': item.codigo,
                  'quandoFoiCriado': item.quandoFoiCriado
                }),
        _atividadeUpdateAdapter = UpdateAdapter(
            database,
            'Atividade',
            ['codigo'],
            (Atividade item) => <String, Object?>{
                  'titulo': item.titulo,
                  'texto': item.texto,
                  'codigo': item.codigo,
                  'quandoFoiCriado': item.quandoFoiCriado
                }),
        _atividadeDeletionAdapter = DeletionAdapter(
            database,
            'Atividade',
            ['codigo'],
            (Atividade item) => <String, Object?>{
                  'titulo': item.titulo,
                  'texto': item.texto,
                  'codigo': item.codigo,
                  'quandoFoiCriado': item.quandoFoiCriado
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Atividade> _atividadeInsertionAdapter;

  final UpdateAdapter<Atividade> _atividadeUpdateAdapter;

  final DeletionAdapter<Atividade> _atividadeDeletionAdapter;

  @override
  Future<Atividade?> getById(int codigo) async {
    return _queryAdapter.query('SELECT * Atividade WHERE codigo = ?1',
        mapper: (Map<String, Object?> row) => Atividade(
            codigo: row['codigo'] as int?,
            quandoFoiCriado: row['quandoFoiCriado'] as String,
            titulo: row['titulo'] as String,
            texto: row['texto'] as String),
        arguments: [codigo]);
  }

  @override
  Future<List<Atividade>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Atividade',
        mapper: (Map<String, Object?> row) => Atividade(
            codigo: row['codigo'] as int?,
            quandoFoiCriado: row['quandoFoiCriado'] as String,
            titulo: row['titulo'] as String,
            texto: row['texto'] as String));
  }

  @override
  Future<int> insertItem(Atividade item) {
    return _atividadeInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Atividade item) {
    return _atividadeUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Atividade item) {
    return _atividadeDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}

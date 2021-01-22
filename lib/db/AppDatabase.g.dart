// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ResultDao _resultDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Result` (`id` INTEGER, `adult` INTEGER, `backdrop_path` TEXT, `original_language` TEXT, `original_title` TEXT, `overview` TEXT, `popularity` REAL, `poster_path` TEXT, `release_date` TEXT, `title` TEXT, `video` INTEGER, `vote_count` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ResultDao get resultDao {
    return _resultDaoInstance ??= _$ResultDao(database, changeListener);
  }
}

class _$ResultDao extends ResultDao {
  _$ResultDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _resultInsertionAdapter = InsertionAdapter(
            database,
            'Result',
            (Result item) => <String, dynamic>{
                  'id': item.id,
                  'adult': item.adult == null ? null : (item.adult ? 1 : 0),
                  'backdrop_path': item.backdrop_path,
                  'original_language': item.original_language,
                  'original_title': item.original_title,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'poster_path': item.poster_path,
                  'release_date': item.release_date,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video ? 1 : 0),
                  'vote_count': item.vote_count
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Result> _resultInsertionAdapter;

  @override
  Future<List<Result>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Result',
        mapper: (Map<String, dynamic> row) => Result(
            adult: row['adult'] == null ? null : (row['adult'] as int) != 0,
            backdrop_path: row['backdrop_path'] as String,
            id: row['id'] as int,
            original_language: row['original_language'] as String,
            original_title: row['original_title'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            poster_path: row['poster_path'] as String,
            release_date: row['release_date'] as String,
            title: row['title'] as String,
            video: row['video'] == null ? null : (row['video'] as int) != 0,
            vote_count: row['vote_count'] as int));
  }

  @override
  Stream<Result> findPersonById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Result WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'Result',
        isView: false,
        mapper: (Map<String, dynamic> row) => Result(
            adult: row['adult'] == null ? null : (row['adult'] as int) != 0,
            backdrop_path: row['backdrop_path'] as String,
            id: row['id'] as int,
            original_language: row['original_language'] as String,
            original_title: row['original_title'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            poster_path: row['poster_path'] as String,
            release_date: row['release_date'] as String,
            title: row['title'] as String,
            video: row['video'] == null ? null : (row['video'] as int) != 0,
            vote_count: row['vote_count'] as int));
  }

  @override
  Future<void> insertPerson(Result person) async {
    await _resultInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAllPerson(List<Result> person) async {
    await _resultInsertionAdapter.insertList(person, OnConflictStrategy.abort);
  }
}

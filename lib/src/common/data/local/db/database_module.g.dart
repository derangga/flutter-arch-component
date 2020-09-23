// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final int movieId;
  final int voteCount;
  final String title;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  Movie(
      {this.id,
      @required this.movieId,
      @required this.voteCount,
      @required this.title,
      @required this.popularity,
      @required this.posterPath,
      @required this.backdropPath,
      @required this.overview,
      @required this.releaseDate});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Movie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      movieId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}movie_id']),
      voteCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      popularity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      posterPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      backdropPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      releaseDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || movieId != null) {
      map['movie_id'] = Variable<int>(movieId);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int>(voteCount);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double>(popularity);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String>(overview);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      movieId: movieId == null && nullToAbsent
          ? const Value.absent()
          : Value(movieId),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      movieId: serializer.fromJson<int>(json['movieId']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      title: serializer.fromJson<String>(json['title']),
      popularity: serializer.fromJson<double>(json['popularity']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'movieId': serializer.toJson<int>(movieId),
      'voteCount': serializer.toJson<int>(voteCount),
      'title': serializer.toJson<String>(title),
      'popularity': serializer.toJson<double>(popularity),
      'posterPath': serializer.toJson<String>(posterPath),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
    };
  }

  Movie copyWith(
          {int id,
          int movieId,
          int voteCount,
          String title,
          double popularity,
          String posterPath,
          String backdropPath,
          String overview,
          String releaseDate}) =>
      Movie(
        id: id ?? this.id,
        movieId: movieId ?? this.movieId,
        voteCount: voteCount ?? this.voteCount,
        title: title ?? this.title,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('title: $title, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          movieId.hashCode,
          $mrjc(
              voteCount.hashCode,
              $mrjc(
                  title.hashCode,
                  $mrjc(
                      popularity.hashCode,
                      $mrjc(
                          posterPath.hashCode,
                          $mrjc(
                              backdropPath.hashCode,
                              $mrjc(overview.hashCode,
                                  releaseDate.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.movieId == this.movieId &&
          other.voteCount == this.voteCount &&
          other.title == this.title &&
          other.popularity == this.popularity &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<int> movieId;
  final Value<int> voteCount;
  final Value<String> title;
  final Value<double> popularity;
  final Value<String> posterPath;
  final Value<String> backdropPath;
  final Value<String> overview;
  final Value<String> releaseDate;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.title = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    @required int movieId,
    @required int voteCount,
    @required String title,
    @required double popularity,
    @required String posterPath,
    @required String backdropPath,
    @required String overview,
    @required String releaseDate,
  })  : movieId = Value(movieId),
        voteCount = Value(voteCount),
        title = Value(title),
        popularity = Value(popularity),
        posterPath = Value(posterPath),
        backdropPath = Value(backdropPath),
        overview = Value(overview),
        releaseDate = Value(releaseDate);
  static Insertable<Movie> custom({
    Expression<int> id,
    Expression<int> movieId,
    Expression<int> voteCount,
    Expression<String> title,
    Expression<double> popularity,
    Expression<String> posterPath,
    Expression<String> backdropPath,
    Expression<String> overview,
    Expression<String> releaseDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
      if (voteCount != null) 'vote_count': voteCount,
      if (title != null) 'title': title,
      if (popularity != null) 'popularity': popularity,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
    });
  }

  MoviesCompanion copyWith(
      {Value<int> id,
      Value<int> movieId,
      Value<int> voteCount,
      Value<String> title,
      Value<double> popularity,
      Value<String> posterPath,
      Value<String> backdropPath,
      Value<String> overview,
      Value<String> releaseDate}) {
    return MoviesCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      voteCount: voteCount ?? this.voteCount,
      title: title ?? this.title,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('title: $title, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  GeneratedIntColumn _movieId;
  @override
  GeneratedIntColumn get movieId => _movieId ??= _constructMovieId();
  GeneratedIntColumn _constructMovieId() {
    return GeneratedIntColumn(
      'movie_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  GeneratedIntColumn _voteCount;
  @override
  GeneratedIntColumn get voteCount => _voteCount ??= _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  GeneratedRealColumn _popularity;
  @override
  GeneratedRealColumn get popularity => _popularity ??= _constructPopularity();
  GeneratedRealColumn _constructPopularity() {
    return GeneratedRealColumn(
      'popularity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  GeneratedTextColumn _posterPath;
  @override
  GeneratedTextColumn get posterPath => _posterPath ??= _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  GeneratedTextColumn _backdropPath;
  @override
  GeneratedTextColumn get backdropPath =>
      _backdropPath ??= _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  GeneratedTextColumn _releaseDate;
  @override
  GeneratedTextColumn get releaseDate =>
      _releaseDate ??= _constructReleaseDate();
  GeneratedTextColumn _constructReleaseDate() {
    return GeneratedTextColumn(
      'release_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        movieId,
        voteCount,
        title,
        popularity,
        posterPath,
        backdropPath,
        overview,
        releaseDate
      ];
  @override
  $MoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies';
  @override
  final String actualTableName = 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id'], _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count'], _voteCountMeta));
    } else if (isInserting) {
      context.missing(_voteCountMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity'], _popularityMeta));
    } else if (isInserting) {
      context.missing(_popularityMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path'], _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path'], _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview'], _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date'], _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Movie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MoviesTable _movies;
  $MoviesTable get movies => _movies ??= $MoviesTable(this);
  MoviesDao _moviesDao;
  MoviesDao get moviesDao => _moviesDao ??= MoviesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}

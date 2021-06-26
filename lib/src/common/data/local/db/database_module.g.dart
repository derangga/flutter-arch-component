// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int movieId;
  final int voteCount;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  Movie(
      {required this.movieId,
      required this.voteCount,
      required this.title,
      required this.posterPath,
      required this.backdropPath,
      required this.overview,
      required this.releaseDate});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movie(
      movieId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie_id'])!,
      voteCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_count'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      posterPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path'])!,
      backdropPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path'])!,
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview'])!,
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['movie_id'] = Variable<int>(movieId);
    map['vote_count'] = Variable<int>(voteCount);
    map['title'] = Variable<String>(title);
    map['poster_path'] = Variable<String>(posterPath);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['overview'] = Variable<String>(overview);
    map['release_date'] = Variable<String>(releaseDate);
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      movieId: Value(movieId),
      voteCount: Value(voteCount),
      title: Value(title),
      posterPath: Value(posterPath),
      backdropPath: Value(backdropPath),
      overview: Value(overview),
      releaseDate: Value(releaseDate),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Movie(
      movieId: serializer.fromJson<int>(json['movieId']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      title: serializer.fromJson<String>(json['title']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movieId': serializer.toJson<int>(movieId),
      'voteCount': serializer.toJson<int>(voteCount),
      'title': serializer.toJson<String>(title),
      'posterPath': serializer.toJson<String>(posterPath),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
    };
  }

  Movie copyWith(
          {int? movieId,
          int? voteCount,
          String? title,
          String? posterPath,
          String? backdropPath,
          String? overview,
          String? releaseDate}) =>
      Movie(
        movieId: movieId ?? this.movieId,
        voteCount: voteCount ?? this.voteCount,
        title: title ?? this.title,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      movieId.hashCode,
      $mrjc(
          voteCount.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  posterPath.hashCode,
                  $mrjc(backdropPath.hashCode,
                      $mrjc(overview.hashCode, releaseDate.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.movieId == this.movieId &&
          other.voteCount == this.voteCount &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> movieId;
  final Value<int> voteCount;
  final Value<String> title;
  final Value<String> posterPath;
  final Value<String> backdropPath;
  final Value<String> overview;
  final Value<String> releaseDate;
  const MoviesCompanion({
    this.movieId = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
  });
  MoviesCompanion.insert({
    required int movieId,
    required int voteCount,
    required String title,
    required String posterPath,
    required String backdropPath,
    required String overview,
    required String releaseDate,
  })  : movieId = Value(movieId),
        voteCount = Value(voteCount),
        title = Value(title),
        posterPath = Value(posterPath),
        backdropPath = Value(backdropPath),
        overview = Value(overview),
        releaseDate = Value(releaseDate);
  static Insertable<Movie> custom({
    Expression<int>? movieId,
    Expression<int>? voteCount,
    Expression<String>? title,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<String>? overview,
    Expression<String>? releaseDate,
  }) {
    return RawValuesInsertable({
      if (movieId != null) 'movie_id': movieId,
      if (voteCount != null) 'vote_count': voteCount,
      if (title != null) 'title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? movieId,
      Value<int>? voteCount,
      Value<String>? title,
      Value<String>? posterPath,
      Value<String>? backdropPath,
      Value<String>? overview,
      Value<String>? releaseDate}) {
    return MoviesCompanion(
      movieId: movieId ?? this.movieId,
      voteCount: voteCount ?? this.voteCount,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int>(voteCount.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
          ..write('movieId: $movieId, ')
          ..write('voteCount: $voteCount, ')
          ..write('title: $title, ')
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
  final String? _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  @override
  late final GeneratedIntColumn movieId = _constructMovieId();
  GeneratedIntColumn _constructMovieId() {
    return GeneratedIntColumn(
      'movie_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  @override
  late final GeneratedIntColumn voteCount = _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedTextColumn posterPath = _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedTextColumn backdropPath = _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedTextColumn overview = _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedTextColumn releaseDate = _constructReleaseDate();
  GeneratedTextColumn _constructReleaseDate() {
    return GeneratedTextColumn(
      'release_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        movieId,
        voteCount,
        title,
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
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    } else if (isInserting) {
      context.missing(_voteCountMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movie.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final MoviesDao moviesDao = MoviesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}

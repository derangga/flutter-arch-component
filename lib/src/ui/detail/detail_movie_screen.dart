import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../base/base_stateful.dart';
import '../../common/data/local/db/database_module.dart';
import '../../common/data/remote/config/api_url.dart';
import '../../common/domain/models/remote/detail_movie_response.dart';
import '../../ui/detail/bloc/detail_movie_bloc.dart';

class DetailMovieScreen extends StatefulWidget {
  late final Movie movie;

  DetailMovieScreen(this.movie);

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState
    extends BaseState<DetailMovieBloc, DetailMovieState, DetailMovieScreen> {

  @override
  void setupOnInitState() {
    bloc.add(GetDetailMovieEvent(widget.movie.movieId));
  }

  @override
  Widget mapStateHandler(DetailMovieState state) {
    if (state is SuccessGetDetailMovieState) {
      return _detailMovieView(state.detailMovie);
    } else if (state is FailedGetDetailMovieState) {
      return _errorText(state.message);
    } else {
      return _loadingView(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movie.title),
        ),
        body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) => mapStateHandler(state),
        ),
    );
  }

  Widget _loadingView(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260.0,
              color: Colors.white,
            ),
            SizedBox(height: 12.0),
            Container(width: double.infinity, height: 20, color: Colors.white),
            SizedBox(height: 12.0),
            Container(width: double.infinity, height: 20, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _detailMovieView(DetailMovieResponse movie) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              width: size.width,
              height: 200,
              child: Image.network(
                "${ApiUrl.IMAGE_URL}${movie.backdropPath}",
                fit: BoxFit.cover,
              )),
          Container(
            margin: EdgeInsets.fromLTRB(8, 12, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title!,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(movie.overview!),
                SizedBox(height: 12),
                Text('Date Release: ${movie.releaseDate}')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _errorText(String message) {
    return Center(
      child: Text(message),
    );
  }
}

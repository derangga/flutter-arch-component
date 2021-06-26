import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_component/src/routing/routing_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/home_bloc.dart';
import '../../base/base_stateful.dart';
import '../../common/data/remote/config/api_url.dart';
import '../../common/data/local/db/database_module.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeBloc, HomeState, HomeScreen> {
  @override
  void setupOnInitState() {
    bloc.add(GetDiscoverMovieEvent());
  }

  @override
  Widget mapStateHandler(HomeState state) {
    if (state is SuccessGetDiscoverState && state.movieList.isNotEmpty) {
      return _moviesCard(state.movieList);
    } else if (state is FailedGetDiscoverState) {
      if (state.movieList.isEmpty) {
        return _errorText(state.message);
      } else {
        showToast(state.message);
        return _moviesCard(state.movieList);
      }
    } else {
      return _loadingView(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Screen')),
        body: Container(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => mapStateHandler(state),
          ),
        ));
  }

  Widget _loadingView(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int item = (size.height / 156).round();
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: ListView.builder(
            itemCount: item,
            itemBuilder: (c, i) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: size.width,
                      height: 100,
                    ),
                    SizedBox(height: 12),
                    Container(
                      color: Colors.white,
                      width: size.width,
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _moviesCard(List<Movie> movies) {
    Size _size = MediaQuery.of(context).size;
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: movies.length,
        itemBuilder: (ctx, pos) {
          Movie movie = movies[pos];
          return Padding(
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routing.DETAIL_MOVIE,
                    arguments: movie);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: _size.width,
                        height: 200,
                        child: CachedNetworkImage(
                          imageUrl: '${ApiUrl.IMAGE_URL}${movie.backdropPath}',
                          fit: BoxFit.cover,
                        )),
                    SizedBox(height: 4.0),
                    Container(
                      margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            movie.title,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Date Release: ${movie.releaseDate}',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _errorText(String message) {
    return Center(
      child: Text(message),
    );
  }
}

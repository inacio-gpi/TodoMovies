// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../../core/constants/strings.dart';
import '../controller/movie_controller.dart';
import '../widgets/rectangle_button_widget.dart';
import '../widgets/similar_movie_card_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieController controller;
  const MovieDetailsPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late ScrollController _scrollController;
  final int movieId = 28;
  @override
  void initState() {
    super.initState();
    widget.controller.getMovieDetails(movieId);
    widget.controller.loadSimilarMovies(movieId);
    widget.controller.loadAllGenres();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 2.0),
                child: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Obx(
          () => widget.controller.movieDetails.value != null
              ? CustomScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.black,
                        expandedHeight:
                            MediaQuery.of(context).size.height / 2.3,
                        stretch: true,
                        flexibleSpace: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            FlexibleSpaceBar(
                              background: Image.network(
                                BASE_IMAGE_URL +
                                    widget.controller.movieDetails.value!
                                        .backdropPath!,
                                fit: BoxFit.cover,
                              ),
                              stretchModes: const [
                                StretchMode.zoomBackground,
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [
                                    0.1,
                                    0.9,
                                  ],
                                  colors: [
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.75),
                                  ],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height / 4,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            widget.controller.movieDetails
                                                .value!.originalTitle,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              // height: 1.5,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            widget.controller.liked.value =
                                                !widget.controller.liked.value;
                                          },
                                          child: SvgPicture.asset(
                                            widget.controller.liked.value
                                                ? HEART_FILL
                                                : HEART_THIN,
                                            height: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          HEART_FILL,
                                          height: 14,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${widget.controller.movieDetails.value!.voteCount} Likes',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        const Icon(
                                          Icons.circle,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "${widget.controller.movieDetails.value?.popularity ?? 0} popularity",
                                          // '3 of 10 Watched',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                () => widget.controller.similarMovies.value ==
                                            null &&
                                        widget.controller.genres.value.isEmpty
                                    ? const CircularProgressIndicator()
                                    : MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: widget
                                                  .controller
                                                  .similarMovies
                                                  .value
                                                  ?.results
                                                  .length ??
                                              0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final movie = widget
                                                .controller
                                                .similarMovies
                                                .value!
                                                .results[index];
                                            return SimilarMovieCardWidget(
                                              movie: movie,
                                              genres: widget
                                                  .controller.genres.value,
                                            );
                                          },
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    RectangleButtonWidget(
                                      backgroundColor:
                                          widget.controller.liked.value
                                              ? Colors.black
                                              : Colors.white,
                                      onPressed: () {
                                        widget.controller.liked.value =
                                            !widget.controller.liked.value;
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            widget.controller.liked.value
                                                ? HEART_FILL
                                                : HEART_THIN,
                                            height: 16,
                                            color: widget.controller.liked.value
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            width: 40,
                                            child: Text(
                                              widget.controller.liked.value
                                                  ? 'Liked'
                                                  : 'Like',
                                              style: TextStyle(
                                                color: widget
                                                        .controller.liked.value
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    RectangleButtonWidget(
                                      onPressed: () {},
                                      child: const Center(
                                        child: Text(
                                          'Adicionar às Minhas Listas',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ])
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}

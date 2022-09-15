import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/constants/strings.dart';
import '../controller/movie_controller.dart';
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
  @override
  void initState() {
    super.initState();
    widget.controller.getMovieDetails(22);
    widget.controller.loadSimilarMovies(22);
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
                        expandedHeight: MediaQuery.of(context).size.height / 2,
                        stretch: true,
                        flexibleSpace: FlexibleSpaceBar(
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
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Column(
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
                                        const FaIcon(
                                          FontAwesomeIcons.heart,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: const [
                                        FaIcon(
                                          FontAwesomeIcons.heart,
                                          size: 14,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '1.2k Likes',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        FaIcon(
                                          FontAwesomeIcons.circle,
                                          size: 14,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '3 of 10 Watched',
                                          style: TextStyle(
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
                                        null
                                    ? const CircularProgressIndicator()
                                    : ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        // addRepaintBoundaries: true,
                                        itemCount: widget
                                            .controller
                                            .similarMovies
                                            .value!
                                            .results
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final movie = widget
                                              .controller
                                              .similarMovies
                                              .value!
                                              .results[index];
                                          return SimilarMovieCardWidget(
                                              movie: movie);
                                        },
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

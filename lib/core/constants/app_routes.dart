import 'package:get/get.dart';

import '../../modules/home/home_binding.dart';
import '../../modules/home/presenter/controller/movie_controller.dart';
import '../../modules/home/presenter/pages/movie_details_page.dart';

class Routes {
  static const String movieDetails = '/movie_details';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.movieDetails,
      page: () => MovieDetailsPage(
        controller: Get.find<MovieController>(),
      ),
      binding: HomeBinding(),
    ),
  ];
}

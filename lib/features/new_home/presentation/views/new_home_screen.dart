import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/common/constants/assets.dart';
import '../../../../core/common/widget/customize_button_2.dart';
import '../../data/models/movie.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  late ThemeData theme;

  // List<String> movies = [
  //   'https://lh3.googleusercontent.com/proxy/WyKOUXIEolzVEhdrm2BE4lLyAgCmMV5nZxGM7am8qZqKgi-X4hG63SB1MM8QjTHdoYBIHy2dpGobNZu88euQhukMAe0jWnD1BEtPYiy-ZyAANydGs8FrUzkzdze4U8pX7IWDynM7fAB6sOZlzfYLlPjkAxxd',
  //   'https://image.tmdb.org/t/p/original/mtqqD00vB4PGRt20gWtGqFhrkd0.jpg',
  //   'https://m.media-amazon.com/images/I/81S7LIaKQHL._AC_UF894,1000_QL80_.jpg',
  //   'https://upload.wikimedia.org/wikipedia/vi/7/7f/Kung_Fu_Panda_4_poster.jpg',
  //   'https://www.elle.vn/wp-content/uploads/2023/12/06/560540/poster-Mai-1024x1450.jpg',
  //   'https://upload.wikimedia.org/wikipedia/vi/6/62/L%E1%BA%ADt_m%E1%BA%B7t_48h_poster.jpg',
  //   'https://upload.wikimedia.org/wikipedia/vi/1/17/Lat_Mat_2_Poster.jpeg',
  // ];`

  List<Movie> movies = [
    Movie(
      title: 'Kung Panda',
      genre: 'Animation',
      posterUrl:
          'https://lh3.googleusercontent.com/proxy/WyKOUXIEolzVEhdrm2BE4lLyAgCmMV5nZxGM7am8qZqKgi-X4hG63SB1MM8QjTHdoYBIHy2dpGobNZu88euQhukMAe0jWnD1BEtPYiy-ZyAANydGs8FrUzkzdze4U8pX7IWDynM7fAB6sOZlzfYLlPjkAxxd',
    ),
    Movie(
      title: 'Kung Panda 2',
      genre: 'Animation',
      posterUrl:
          'https://image.tmdb.org/t/p/original/mtqqD00vB4PGRt20gWtGqFhrkd0.jpg',
    ),
    Movie(
      title: 'Kung Panda 3',
      genre: 'Animation',
      posterUrl:
          'https://m.media-amazon.com/images/I/81S7LIaKQHL._AC_UF894,1000_QL80_.jpg',
    ),
    Movie(
      title: 'Kung Panda 4',
      genre: 'Animation',
      posterUrl:
          'https://upload.wikimedia.org/wikipedia/vi/7/7f/Kung_Fu_Panda_4_poster.jpg',
    ),
    Movie(
      title: 'Mai',
      genre: 'Drama',
      posterUrl:
          'https://www.elle.vn/wp-content/uploads/2023/12/06/560540/poster-Mai-1024x1450.jpg',
    ),
    Movie(
      title: 'Lật mặt 5',
      genre: 'Action',
      posterUrl:
          'https://upload.wikimedia.org/wikipedia/vi/6/62/L%E1%BA%ADt_m%E1%BA%B7t_48h_poster.jpg',
    ),
    Movie(
      title: 'Lật mặt 2',
      genre: 'Action, Comedy',
      posterUrl:
          'https://upload.wikimedia.org/wikipedia/vi/1/17/Lat_Mat_2_Poster.jpeg',
    ),
  ];

  int carouselActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: theme.colorScheme.background,
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              _buildAppbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildUpcomingCarousel(),
                      _buildNowInCinema(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      color: theme.colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.svg.icProductLogo),
          // AppBarInfoItem (icon: maps, label: TP.HCM)
          _buildAppbarInfoItem(assets: Assets.svg.icLocation, label: 'TP.HCM'),
          // AppBarInfoItem (icon: translate, label: Eng)
          _buildAppbarInfoItem(assets: Assets.svg.icLanguage, label: 'Eng'),
          // Button (customize)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomizeButton2(
              onPress: () {},
              text: 'Profile',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbarInfoItem({required String assets, required String label}) {
    return Row(
      children: [
        SvgPicture.asset(assets),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildUpcomingCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text(
            'Upcoming',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          items:
              movies.map((e) => _buildCarouselItem(e.posterUrl ?? '')).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                carouselActiveIndex = index;
              });
            },
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            aspectRatio: 16 / 9,
            viewportFraction: 0.55,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          activeIndex: carouselActiveIndex,
          count: movies.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: theme.colorScheme.primary,
            dotColor: theme.colorScheme.primaryContainer,
          ),
        ),
      ],
    );
  }

  Container _buildCarouselItem(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(url),
    );
  }

  Widget _buildNowInCinema() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Now in Cinemas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.search,
                size: 36,
                color: theme.colorScheme.primaryContainer,
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // width height ratio
            childAspectRatio: 163 / 278,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: movies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Image.network(
                    movies[index].posterUrl ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  movies[index].title ?? '--',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  movies[index].genre ?? '--',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.primaryContainer),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  // Scaffold => singleChildScroll => Column => GridView (Expanded)
}

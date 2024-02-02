import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vinemas_app/core/common/contants/assets.dart';
import 'package:vinemas_app/core/common/widget/customize_button.dart';
import 'package:vinemas_app/core/utils/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData _themeData;
  int currentCarouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    List<String> list = [
      '/sjLLA6PGxoN0kmCuwxgb8CR0F29.jpg',
      '/pyVuoZzw2mpBmcYE8sb5EB8NwJ6.jpg',
      '/5ADSui2pPyBuIxfxXKiptTdGAT8.jpg',
      '/tq9dWzV5IORonLIsBqUjYhVaBwa.jpg',
      '/qgotFL0XUevylN2enbc3SeT7x2m.jpg'
    ];
    final size = MediaQuery.of(context).size;
    final cardWidth = (size.width - 48) / 2;
    final cardHeight = cardWidth * 278 / 163 + 40;
    final ratio = cardWidth / cardHeight;
    final safePadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: _themeData.colorScheme.background,
      body: Column(
        children: [
          Container(
            color: _themeData.colorScheme.surface,
            height: safePadding,
          ),
          _buildAppbarCustom(context),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _buildCarouselUpcoming(size, list),
                ),
                SliverToBoxAdapter(
                  child: _buildNowInCinemasTitle(context),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid.builder(
                      itemCount: list.length,
                      // gridDelegate:
                      // const SliverGridDelegateWithMaxCrossAxisExtent(
                      //     maxCrossAxisExtent: 163,
                      //     childAspectRatio: 163 / (278 + 50),
                      //     crossAxisSpacing: 16,
                      //     mainAxisSpacing: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: ratio,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        final item = list[index];
                        return _buildNowInCinemasItem(item);
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbarCustom(BuildContext context) {
    return Container(
      color: _themeData.colorScheme.surface,
      padding: const EdgeInsets.all(16).copyWith(top: 8),
      child: Row(children: [
        Expanded(
            child: Container(
          constraints: const BoxConstraints(maxHeight: 48),
          child: SvgPicture.asset(
            Assets.svg.icAppIcon,
            alignment: Alignment.centerLeft,
          ),
        )),
        _buildHeaderGroup(asset: Assets.svg.icLocation, title: 'TP.HCM'),
        _buildHeaderGroup(asset: Assets.svg.icLanguage, title: 'Vie'),
        CustomizedButton(
          onTap: () {},
          text: translate(context).profile,
          backgroundColor: _themeData.colorScheme.primary,
          height: 40,
        )
      ]),
    );
  }

  Widget _buildHeaderGroup({required String asset, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            asset,
            width: 24,
            height: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: _themeData.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselUpcoming(Size size, List<String> list) {
    return Container(
      width: double.infinity,
      color: _themeData.colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(16),
            child: Text(
              translate(context).upcoming,
              style: _themeData.textTheme.titleLarge,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    currentCarouselIndex = index;
                  });
                },
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                height: size.height / 3,
                aspectRatio: 16 / 9,
                viewportFraction: 0.55,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom),
            items: list.map((item) => _buildCarouselItem(item)).toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentCarouselIndex,
            count: list.length,
            effect: ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: _themeData.colorScheme.primary,
                dotColor: _themeData.colorScheme.primaryContainer),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String item) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Image.network(
          'https://image.tmdb.org/t/p/w780$item',
        ),
      ),
    );
  }

  Widget _buildNowInCinemasTitle(BuildContext context) {
    return Container(
      color: _themeData.colorScheme.background,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              translate(context).nowInCinemas,
              style: _themeData.textTheme.titleLarge,
            ),
          ),
          SvgPicture.asset(Assets.svg.icSearch)
        ],
      ),
    );
  }

  Widget _buildNowInCinemasItem(String item) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Stack(alignment: Alignment.topRight, children: [
            Image.network(
              'https://image.tmdb.org/t/p/w780$item',
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _themeData.colorScheme.primary),
              child: Text(
                '8.5',
                style: _themeData.textTheme.labelMedium?.copyWith(
                    color: _themeData.colorScheme.onPrimaryContainer),
              ),
            )
          ]),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Spider Man - Far from home',
            maxLines: 2,
            style: _themeData.textTheme.titleMedium
                ?.copyWith(color: _themeData.colorScheme.onPrimary),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Action',
            maxLines: 1,
            style: _themeData.textTheme.bodyMedium
                ?.copyWith(color: _themeData.colorScheme.primaryContainer),
          ),
        )
      ],
    );
  }
}

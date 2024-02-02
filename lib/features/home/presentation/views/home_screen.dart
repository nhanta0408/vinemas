import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
      backgroundColor: _themeData.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppbarCustom(context),
            Expanded(
              child: Container(
                width: double.infinity,
                color: _themeData.colorScheme.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Upcoming',
                        style: _themeData.textTheme.titleLarge,
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          enlargeFactor: 0.4,
                          height: 300,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.55,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                      items: list
                          .map((item) => GestureDetector(
                                onTap: () {
                                  print(item);
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w780$item',
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAppbarCustom(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 64,
      child: Row(children: [
        SvgPicture.asset(
          Assets.svg.icAppIcon,
          width: 40,
          height: 40,
        ),
        Expanded(child: Container()),
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

  Padding _buildHeaderGroup({required String asset, required String title}) {
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
}

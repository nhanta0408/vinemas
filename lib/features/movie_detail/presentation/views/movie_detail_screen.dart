import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/common/contants/assets.dart';
import '../../../../core/common/widget/customize_button.dart';
import '../../../../core/utils/localizations.dart';

part 'movie_detail_screen.action.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;
  late YoutubePlayerController youtubeController;
  @override
  void initState() {
    super.initState();
    youtubeController = YoutubePlayerController(
      initialVideoId: 'cQfo0HJhCnE',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Spider Man - Far from home',
            style: _textTheme.titleMedium,
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(translate(context).about),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(translate(context).sessions),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAboutTab(),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildToolbarItem()),
                    Expanded(child: _buildToolbarItem()),
                    Expanded(child: _buildToolbarItem()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildToolbarItem() {
    return Column(
      children: [
        Image.asset(Assets.images.icFBSignIn),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Appril 18',
          style: _textTheme.titleSmall,
        ),
      ],
    );
  }

  Builder _buildAboutTab() {
    return Builder(
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      color: Colors.red,
                      width: width,
                      height: width * 9 / 16,
                      child: YoutubePlayer(
                        showVideoProgressIndicator: true,
                        topActions: [
                          GestureDetector(
                            onTap: () {
                              print('Mở app youtube');
                            },
                            child: const Text('Official Trailer - YouTube'),
                          ),
                        ],
                        bottomActions: [
                          GestureDetector(
                            onTap: () {
                              print('Mở app youtube');
                            },
                            child: SizedBox(
                              width: 48,
                              height: 48,
                              child: Image.network(
                                'https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png',
                              ),
                            ),
                          ),
                        ],
                        progressIndicatorColor: Colors.red,
                        progressColors: const ProgressBarColors(
                          backgroundColor: Colors.grey,
                          playedColor: Colors.red,
                          bufferedColor: Colors.grey,
                          handleColor: Colors.grey,
                        ),
                        controller: youtubeController,
                      ),
                    ),
                    Container(
                      color: _colorScheme.surface,
                      child: Row(
                        children: [
                          _buildRatingItem(),
                          Container(
                            width: 1,
                            height: 70,
                            color: _colorScheme.outline,
                          ),
                          _buildRatingItem(),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.',
                            style: _textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          _buildMovieInfoRow('Certificate', '16+'),
                          _buildMovieInfoRow('Runtime', '02:56'),
                          _buildMovieInfoRow('Release', '2022'),
                          _buildMovieInfoRow('Genre', 'Action, Crime, Drama'),
                          _buildMovieInfoRow('Director', 'Matt Reeves'),
                          _buildMovieInfoRow(
                            'Cast',
                            'Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, 	Andy Serkis, Peter Sarsgaard',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: _colorScheme.surface.withOpacity(0.7),
              padding: const EdgeInsets.all(16),
              child: CustomizedButton(
                onTap: () {},
                text: translate(context).selectSessions,
                backgroundColor: _colorScheme.primary,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMovieInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.primaryContainer),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.onBackground),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildRatingItem() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              '8.3',
              style: _textTheme.titleLarge,
            ),
            Text(
              'IDMB',
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.primaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}

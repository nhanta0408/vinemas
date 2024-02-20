part of 'movie_detail_screen.dart';

extension _MovieDetailScreenAction on _MovieDetailScreenState {
  void blocListener(BuildContext context, MovieDetailState state) {
    if (state.status == BlocStatusState.loading) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
  }
}

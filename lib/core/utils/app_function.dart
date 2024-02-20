import 'package:flutter/material.dart';

import '../common/constants/app_constants.dart';
import '../common/enums/image_size.dart';

String getImageUrl(
  String? id, {
  ImageMovieSize imageMovieSize = ImageMovieSize.w500,
}) {
  if (id == null) {
    return noPosterImageUrl;
  }
  return '$image500BaseUrl/$id';
}

Color getVoteAverageBgColor(double? voteAvg, ThemeData theme) {
  if (voteAvg == null) {
    return theme.colorScheme.primary;
  }
  switch (voteAvg) {
    case >= 0 && < 5:
      return theme.colorScheme.error;
    case >= 7 && < 10:
      return theme.colorScheme.secondary;
    default:
      return theme.colorScheme.primary;
  }
}

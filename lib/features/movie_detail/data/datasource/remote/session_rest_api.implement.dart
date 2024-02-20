import 'dart:math';

import '../../models/session_model.dart';
import 'session_rest_api.dart';

class SessionRestApiImplement extends SessionRestApi {
  @override
  Future<List<SessionModel>?> getMovieSession(
    String id,
    DateTime dateTime,
  ) async {
    final mockTheater = [
      'Thiso Cinema',
      'Vạn Hạnh Mall Cinema',
      'Đồng Khởi Cinema',
      'Quang Trung Cinema',
      'AEON Tân Phú Cinema',
      'Hùng Vương Cinema',
      'Gigamall Cinema',
    ];
    final mockFilmFormatWithPrice = [
      {
        'format': 'IMAX',
        'adult': 200000.0,
        'children': 100000.0,
        'student': 150000.0,
        'vip': 175000.0,
      },
      {
        'format': '3D Max',
        'adult': 200000.0,
        'children': 100000.0,
        'student': 150000.0,
        'vip': 150000.0,
      },
      {
        'format': '3D',
        'adult': 150000.0,
        'children': 50000.0,
        'student': 100000.0,
        'vip': 100000.0,
      },
      {
        'format': '2D',
        'adult': 80000.0,
        'children': 400000.0,
        'student': 69000.0,
        'vip': 79000.0,
      },
    ];
    final date = dateTime.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );

    await Future.delayed(const Duration(seconds: 2), () {});
    return List.generate(10, (index) {
      mockFilmFormatWithPrice.shuffle();
      final filmFormatAndPrice = mockFilmFormatWithPrice.first;
      mockTheater.shuffle();
      return SessionModel(
        time: date.add(
          Duration(hours: 10, minutes: 30 * index),
        ),
        theaterName: mockTheater.first,
        filmFormat: filmFormatAndPrice['format'] as String?,
        adultCost: filmFormatAndPrice['adult'] as double?,
        childCost: filmFormatAndPrice['children'] as double?,
        studentCost: filmFormatAndPrice['student'] as double?,
        vipCost: filmFormatAndPrice['vip'] as double?,
      );
    }).toList();
  }
}

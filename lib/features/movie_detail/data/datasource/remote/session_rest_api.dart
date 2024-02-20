import '../../models/session_model.dart';

abstract class SessionRestApi {
  Future<List<SessionModel>?> getMovieSession(String id, DateTime dateTime);
}

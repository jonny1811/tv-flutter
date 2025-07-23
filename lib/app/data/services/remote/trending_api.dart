import '../../../domain/enums.dart';
import '../../../domain/models/media/media.dart';
import '../../../domain/typedefs.dart';
import '../../http/http.dart';

class TrendingAPI {
  final Http _http;

  TrendingAPI(this._http);

  getMoviesAndSeries(TimeWindow timeWindow) async {
    final result = await _http.request(
      '/trending/all/${timeWindow.name}',
      onSuccess: (json) {
        final list = json['results'] as List<Json>;

        return list
            .where((e) => e['media_type'] != 'person')
            .map((e) => Media.fromJson(e))
            .toList();
      },
    );
  }
}

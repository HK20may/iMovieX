import 'package:share_plus/share_plus.dart';

class ShareWidget {
  static void shareMovie(int movieId, String movieTitle) {
    final deepLink = 'imoviex://movie/$movieId';

    SharePlus.instance.share(
      ShareParams(
        text: 'Check out "$movieTitle" on iMovieX!\n$deepLink',
        subject: 'Movie Recommendation',
      ),
    );
  }
}

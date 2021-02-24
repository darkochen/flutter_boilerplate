import '../utils/constants.dart';

class ArticlesRequestParames {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  ArticlesRequestParames({
    this.apiKey = kApiKey,
    this.country = 'us',
    this.category = 'general',
    this.page = 1,
    this.pageSize = 20,
  });
}

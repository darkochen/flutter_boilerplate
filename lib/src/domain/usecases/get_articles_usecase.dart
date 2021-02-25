import 'package:flutter_news_app/src/domain/repositories/articles_repository.dart';

import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../entities/article.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesRequestParames> {
  final ArticlesRepository _articlesRepository;

  GetArticlesUseCase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({ArticlesRequestParames params}) {
    return _articlesRepository.getBreakingNewsArticles(params);
  }
}

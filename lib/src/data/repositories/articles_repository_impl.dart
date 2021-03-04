import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_news_app/src/core/params/article_request.dart';
import 'package:flutter_news_app/src/core/resources/data_state.dart';
import 'package:flutter_news_app/src/data/datasources/remote/news_api_service.dart';
import 'package:flutter_news_app/src/domain/entities/article.dart';
import 'package:flutter_news_app/src/domain/repositories/articles_repository.dart';

class ArticleRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;

  const ArticleRepositoryImpl(
    this._newsApiService,
  );

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParames params) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        country: params.country,
        category: params.category,
        page: params.page,
        pageSize: params.pageSize,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          request: httpResponse.response.request,
          type: DioErrorType.RESPONSE,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdsNotifier extends StateNotifier<List<int>> {
  ArticleIdsNotifier() : super([]);

  void updateArticleIds(List<int> ids) {
    state = ids;
  }
}

final articleIdsProvider = StateNotifierProvider<ArticleIdsNotifier, List<int>>((ref) {
  return ArticleIdsNotifier();
});

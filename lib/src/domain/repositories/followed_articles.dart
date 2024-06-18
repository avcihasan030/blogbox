// import 'package:blogbox/src/data/models/blog.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class FollowedArticlesNotifier extends StateNotifier<List<Blog>> {
//   FollowedArticlesNotifier() : super([]);
//
//   void toggleFollowedArticles(Blog blog) {
//     if (state.contains(blog.id)) {
//       unfollowArticle(blog.id);
//     } else {
//       followArticle(blog);
//     }
//   }
//
//   void followArticle(Blog blog) {
//     state = [...state, blog];
//   }
//
//   void unfollowArticle(String id) {
//     state = state.where((blog) => blog.id != id).toList();
//   }
//
//   bool isFavorite(String id) {
//     return state.any((blog) => blog.id == id);
//   }
// }
//
// final followedArticlesProvider =
//     StateNotifierProvider<FollowedArticlesNotifier, List<Blog>>(
//         (ref) => FollowedArticlesNotifier());
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blogbox/src/data/models/blog.dart';

// Beğenilen makaleleri depolamak için bir provider oluştur
final favoriteArticlesProvider =
    StateNotifierProvider<FavoriteArticlesNotifier, List<Blog>>((ref) {
  return FavoriteArticlesNotifier();
});

class FavoriteArticlesNotifier extends StateNotifier<List<Blog>> {
  FavoriteArticlesNotifier() : super([]);

  // Makaleyi beğenilenlere ekle
  void addToFavorites(Blog article) {
    state = [...state, article];
  }

  // Makaleyi beğenilenlerden kaldır
  void removeFromFavorites(Blog article) {
    state = state.where((item) => item.id != article.id).toList();
  }
}

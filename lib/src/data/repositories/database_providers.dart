import 'package:blogbox/src/data/models/blog.dart';
import 'package:blogbox/src/data/repositories/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final articlesProvider = FutureProvider<List<Blog>>((ref) async {
  final firestoreService = ref.read(firestoreServiceProvider);
  return await firestoreService.getArticles();
});

final publicationProvider = FutureProvider<List<String>>((ref) async {
  final firestoreService = ref.read(firestoreServiceProvider);
  return await firestoreService.getPublications();
});

final articlesByPublicationsProvider =
    FutureProvider.family<List<Blog>, String>((ref, publication) async {
  final firestoreService = ref.read(firestoreServiceProvider);
  return await firestoreService.getArticlesByPublication(publication);
});
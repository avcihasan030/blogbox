import 'package:blogbox/src/domain/repositories/followed_articles.dart';
import 'package:blogbox/src/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Following extends ConsumerWidget {
  const Following({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(favoriteArticlesProvider);
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final currentArticle = articles[index];
          return GestureDetector(
            onTap: () {
              debugPrint('Makale ${index + 1} tıklandı');
            },
            child: PostCard(currentArticle),
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}

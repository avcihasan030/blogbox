import 'package:blogbox/src/data/repositories/database_providers.dart';
import 'package:blogbox/src/presentation/widgets/article_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Explore extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articlesProvider);
    return articles.when(
      data: (data) => ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetail(data[index]),
                  ));
              debugPrint('Makale ${index + 1} tıklandı');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/${data[index].image}',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      filterQuality: FilterQuality.high,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data[index].subtitle,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      error: (error, stackTrace) {
        return Center(
          child: Text("Failed to load blogs from database : $error"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

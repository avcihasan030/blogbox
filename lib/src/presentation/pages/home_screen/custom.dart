import 'package:blogbox/src/data/repositories/database_providers.dart';
import 'package:blogbox/src/presentation/widgets/blog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BlogList extends ConsumerWidget {
  final String publication;

  const BlogList(this.publication, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesByPublication =
    ref.watch(articlesByPublicationsProvider(publication));
    return articlesByPublication.when(
      data: (articles) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final blog = articles[index];
            return BlogItem(blog);
          },
          itemCount: articles.length,
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text("Failed to fetch blogs: $error"),
        );
      },
      loading: () {
        return const SpinKitSquareCircle(
          color: Colors.white,
        );
      },
    );
  }
}
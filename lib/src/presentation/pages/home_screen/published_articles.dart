import 'dart:math';

import 'package:blogbox/src/domain/use_cases/recommendation_system/recommendations.dart';
import 'package:blogbox/src/presentation/widgets/recommended_blog_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForYou extends ConsumerStatefulWidget {
  const ForYou({super.key});

  @override
  ConsumerState createState() => _ForYouState();
}

class _ForYouState extends ConsumerState<ForYou> {
  final articleIds = [
    22,
    27,
    15,
    16,
    18,
    19,
    67,
    68,
    72,
    76,
    252,
    253,
    255,
    306,
    308,
    309,
    6505,
    6503,
    6457,
    4349,
    4350,
    2159,
    2168
  ];
  List<int> randomArticleIds = [];

  List<int> getTwoRandomElements(List<int> list) {
    final random = Random();
    int firstIndex = random.nextInt(list.length);
    int secondIndex;
    do {
      secondIndex = random.nextInt(list.length);
    } while (secondIndex == firstIndex);

    return [list[firstIndex], list[secondIndex]];
  }

  @override
  void initState() {
    super.initState();
    randomArticleIds = getTwoRandomElements(articleIds);
  }

  @override
  Widget build(BuildContext context) {
    final recommendations = ref.watch(recommendationProvider(randomArticleIds));
    return recommendations.when(
      data: (blogs) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final blog = blogs[index];
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecommendedBlogDetail(blog),
                    ));
              },
              title: Text(
                blog.title,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                blog.subtitle,
                overflow: TextOverflow.ellipsis,
              ),
              leading: Container(
                height: 50,
                width: 50,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: 'http://10.0.2.2:8000/images/${blog.image}',
                  filterQuality: FilterQuality.high,
                ),
              ),
            );
          },
          itemCount: blogs.length,
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text("Failed to load recommendations: $error"),
        );
      },
      loading: () {
        return const SpinKitSquareCircle(
          color: Colors.white,
          size: 100,
        );
      },
    );
  }
}

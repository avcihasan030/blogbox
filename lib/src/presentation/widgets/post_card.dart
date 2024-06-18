import 'package:blogbox/src/data/models/blog.dart';
import 'package:blogbox/src/presentation/widgets/article_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCard extends ConsumerStatefulWidget {
  final Blog article;

  const PostCard(this.article, {super.key});

  @override
  ConsumerState createState() => _FeaturedCardState();
}

class _FeaturedCardState extends ConsumerState<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetail(widget.article),
              ));
        },
        leading: buildAssetImage(),
        title: buildTitlePadding(),
        subtitle: buildSubtitlePadding(),
        isThreeLine: true,
      ),
    );
  }

  Padding buildSubtitlePadding() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        widget.article.publication,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Padding buildTitlePadding() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Text(
        widget.article.title,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  buildAssetImage() {
    return Container(
      width: 50,
      height: 50,
      child: Image.asset(
        'images/${widget.article.image}',
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

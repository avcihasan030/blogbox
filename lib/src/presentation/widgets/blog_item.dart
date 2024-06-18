import 'package:blogbox/src/data/models/blog.dart';
import 'package:blogbox/src/presentation/widgets/article_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogItem extends ConsumerWidget {
  final Blog blogs;

  const BlogItem(this.blogs, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetail(blogs),
            ));
      },
      leading: _buildBlogCoverImage(),
      title: _buildTitlePadding(),
      subtitle: _buildSubtitlePadding(),
      isThreeLine: true,
    );
  }

  _buildTitlePadding() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        blogs.title,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildSubtitlePadding() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        blogs.subtitle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildBlogCoverImage() {
    // return Image.network(
    //   blogs.image,
    //   width: 50,
    //   height: 50,
    //   fit: BoxFit.cover,
    // );
    // return CachedNetworkImage(
    //   imageUrl: blogs.image,
    //   width: 50,
    //   height: 50,
    //   fit: BoxFit.cover,
    //   filterQuality: FilterQuality.high,
    // );
    return Image.asset(
      'images/${blogs.image}',
      width: 50,
      height: 50,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
    );
  }
}

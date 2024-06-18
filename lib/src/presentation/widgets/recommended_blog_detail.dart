import 'package:blogbox/src/data/models/blog.dart';
import 'package:blogbox/src/domain/repositories/followed_articles.dart';
import 'package:blogbox/src/presentation/widgets/comment_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendedBlogDetail extends ConsumerStatefulWidget {
  final Blog article;

  const RecommendedBlogDetail(this.article, {super.key});

  @override
  ConsumerState createState() => _RecommendedBlogDetailState();
}

class _RecommendedBlogDetailState extends ConsumerState<RecommendedBlogDetail> {
  final firestore = FirebaseFirestore.instance;
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteArticlesProvider);
    final isFavorite = favorites.any((blog) => blog.id == widget.article.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: 'http://10.0.2.2:8000/images/${widget.article.image}',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(height: 16),
              Text(
                widget.article.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 8),
              Text(
                widget.article.subtitle,
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    label: Text(
                      widget.article.publication,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    backgroundColor: Colors.lightBlue,
                  ),
                  Text(
                    widget.article.date,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //_buildLikeButton(isFavorite),
                      // IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       widget.article.isFavorite =
                      //           !widget.article.isFavorite;
                      //     });
                      //   },
                      //   icon: widget.article.isFavorite
                      //       ? const Icon(Icons.thumb_up)
                      //       : const Icon(Icons.thumb_up_alt_outlined),
                      //   color: Colors.lightBlue,
                      // ),
                      IconButton(
                        onPressed: () {
                          if (isFavorite) {
                            ref
                                .read(favoriteArticlesProvider.notifier)
                                .removeFromFavorites(widget.article);
                          } else {
                            ref
                                .read(favoriteArticlesProvider.notifier)
                                .addToFavorites(widget.article);
                          }
                        },
                        icon: isFavorite
                            ? const Icon(
                                Icons.favorite,
                                size: 28,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                size: 28,
                              ),
                        color: Colors.red,
                      ),
                      Text(
                        widget.article.claps.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  //const SizedBox(width: 20),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined)),
                      Text(
                        widget.article.readingTime.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _launchURL(widget.article.url),
                child: Text(
                  widget.article.url,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: commentController,
                decoration: const InputDecoration(
                  labelText: 'Yorum yapın',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      String comment = commentController.text;
                      if (comment.isNotEmpty) {
                        await firestore
                            .collection('comments')
                            .doc(widget.article.id.toString())
                            .collection('user_comments')
                            .add({
                          'comment': comment,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        commentController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Yorum yapıldı')),
                        );
                      }
                    },
                    child: const Text('Yorum Yap'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CommentsScreen(articleId: widget.article.id),
                            ));
                      },
                      child: const Text("Yorumları Gör")),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl((uri));
    } else {
      throw 'Could not launch $url';
    }
  }
}

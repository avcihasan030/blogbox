import 'package:blogbox/src/data/models/blog.dart';

class Publication {
  final String name;
  final List<Blog> blogs;
  final String? image;

  Publication({required this.name, required this.blogs, this.image});

  factory Publication.fromMap(Map<String, dynamic> map) {
    return Publication(
      name: map['name'] as String,
      blogs: map['blogs'] as List<Blog>,
      image: map['image'] as String,
    );
  }
}


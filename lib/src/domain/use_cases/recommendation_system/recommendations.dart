// import 'package:blogbox/src/data/models/blog.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// final recommendationProvider = FutureProvider.family<List<Blog>, String>((ref, articleId) async {
//   final response = await http.post(
//     Uri.parse('http://10.0.2.2:8000/get_article_recommendations'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{'article_id': articleId}),
//   );
//
//   if (response.statusCode == 200) {
//     List<dynamic> data = json.decode(response.body)['recommended_articles'];
//     return data.map((json) => Blog.fromMap(json)).toList();
//   } else {
//     throw Exception('Failed to load recommendations');
//   }
// });
import 'package:blogbox/src/data/models/blog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final recommendationProvider = FutureProvider.family<List<Blog>, List<int>>((ref, articleIds) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/get_article_recommendations'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{'article_ids': articleIds}),
  );

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['recommended_articles'];
    return data.map((json) => Blog.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load recommendations');
  }
});

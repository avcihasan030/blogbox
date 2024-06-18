import 'package:blogbox/src/data/models/blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final CollectionReference articlesCollection =
      FirebaseFirestore.instance.collection('articles');
  final storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// fetch articles data from firestore database
  Future<List<Blog>> getArticles() async {
    try {
      final response = await articlesCollection.get();
      final List<Blog> blogs = [];

      for (var doc in response.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String image = data['image'];
        //String imageUrl = await _getImageUrl(image);
        blogs.add(Blog(
            claps: data['claps'],
            date: data['date'],
            id: data['id'],
            image: image,
            publication: data['publication'],
            readingTime: data['reading_time'],
            responses: data['responses'],
            subtitle: data['subtitle'],
            title: data['title'],
            url: data['url']));
      }
      return blogs;
    } catch (e) {
      throw Exception("Failed to fetch articles: $e");
    }
  }

  /// fetch list of publications
  Future<List<String>> getPublications() async {
    try {
      final response = await articlesCollection.get();
      Set<String> publications = {};

      for (var doc in response.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String publication = data['publication'];
        publications.add(publication);
      }
      return publications.toList();
    } catch (e) {
      throw Exception("Failed to fetch publications: $e");
    }
  }

  Future<List<Blog>> getArticlesByPublication(String publication) async {
    try {
      final response = await articlesCollection
          .where('publication', isEqualTo: publication)
          .get();
      List<Blog> articles = [];

      for (var doc in response.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Blog articleData = Blog(
          claps: data['claps'],
          date: data['date'],
          id: doc.id,
          image: data['image'],
          publication: publication,
          readingTime: data['reading_time'],
          responses: data['responses'],
          subtitle: data['subtitle'],
          title: data['title'],
          url: data['url'],
        );
        articles.add(articleData);
      }
      return articles;
    } catch (e) {
      throw Exception("Failed to fetch articles : $e");
    }
  }

  /// get urls of article's images from firebase storage
  Future<String> _getImageUrl(String imageName) async {
    try {
      String url =
          await storage.ref().child("images/$imageName").getDownloadURL();
      return url;
    } catch (e) {
      debugPrint("Failed to get image URL: $e");
      return '';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class CommentsScreen extends StatelessWidget {
  final dynamic articleId;

  const CommentsScreen({required this.articleId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yorumlar'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('comments')
            .doc(articleId.toString())
            .collection('user_comments')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SpinKitSquareCircle(
              color: Colors.white,
              size: 100,
            ));
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Bir hata oluştu'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Henüz yorum yapılmamış'));
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              String formattedDate = doc['timestamp'] != null
                  ? DateFormat('yyyy-MM-dd').format(doc['timestamp'].toDate())
                  : 'Tarih yok';
              return ListTile(
                isThreeLine: true,
                leading: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/027/708/418/non_2x/default-avatar-profile-icon-in-flat-style-free-vector.jpg'),
                ),
                title: Text(doc['comment']),
                subtitle: Text(formattedDate),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

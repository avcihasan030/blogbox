import 'package:blogbox/src/data/repositories/database_providers.dart';
import 'package:blogbox/src/presentation/pages/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogsAsyncValue = ref.watch(articlesProvider);
    return blogsAsyncValue.when(
      data: (data) {
        return const MyHomePage(title: 'Journalize');
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text('Failed to load data: $error'),
          ),
        );
      },
      loading: () {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/blog2.jpeg',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 5),
              const Text("Yükleniyor... Sabrınız için teşekkür ederiz."),
              const SizedBox(
                height: 5,
              ),
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:blogbox/src/data/repositories/database_providers.dart';
import 'package:blogbox/src/presentation/pages/home_screen/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Headlines extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publications = ref.watch(publicationProvider);
    return publications.when(
      data: (data) {
        return DefaultTabController(
          length: data.length,
          child: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  padding: const EdgeInsets.all(8),
                  indicatorColor: Colors.red,
                  labelStyle: const TextStyle(color: Colors.orange),
                  tabs: data
                      .map(
                        (publication) => Tab(
                          text: publication,
                        ),
                      )
                      .toList(),
                ),
              ),
              body: TabBarView(
                  children: data.map((publication) {
                return BlogList(publication);
              }).toList()),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text("Failed to fetch publications: $error"),
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

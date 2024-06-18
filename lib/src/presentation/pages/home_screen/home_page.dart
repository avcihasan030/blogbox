import 'package:blogbox/src/data/data_sources/auth_datasource.dart';
import 'package:blogbox/src/presentation/manager/widget_providers.dart';
import 'package:blogbox/src/presentation/widgets/show_dialog.dart';
import 'package:blogbox/src/presentation/widgets/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.locale;
    final selectedIndex = ref.watch(selectedTabIndexProvider);
    final pages = ref.watch(tabItemPagesProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            debugPrint('Search Icon Pressed');
          },
          icon: const Icon(
            Icons.search,
            size: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.5,
                      child: _buildSideSheetContent(context),
                    );
                  },
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/027/708/418/non_2x/default-avatar-profile-icon-in-flat-style-free-vector.jpg'),
                radius: 18,
              ),
            ),
          ),
        ],
      ),
      body: Center(child: pages[selectedIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GNav(
          gap: 8,
          padding: const EdgeInsets.all(16),
          onTabChange: (value) {
            ref.read(selectedTabIndexProvider.notifier).state = value;
          },
          tabs: [
            GButton(
              icon: Icons.explore_outlined,
              text: TextUtils.explore.tr(),
            ),
            GButton(
              icon: Icons.language_outlined,
              text: TextUtils.headlines.tr(),
            ),
            GButton(
              icon: Icons.star_border_outlined,
              text: TextUtils.following.tr(),
            ),
            GButton(
              icon: FontAwesomeIcons.rss,
              text: TextUtils.forYou.tr(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideSheetContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextUtils.profile.tr(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: Text(TextUtils.account.tr()),
            onTap: () {
              // Account işlemleri
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(TextUtils.languageSettings.tr()),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ShowAlertDilaog(
                  parentContext: context,
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(TextUtils.logout.tr()),
            onTap: () {
              FirebaseAuthDataSource().signOut().then(
                    (value) => Navigator.pop,
                  );
            },
          ),
        ],
      ),
    );
  }
}

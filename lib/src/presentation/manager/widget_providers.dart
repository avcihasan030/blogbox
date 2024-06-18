

import 'package:blogbox/src/domain/entities/article_model.dart';
import 'package:blogbox/src/presentation/pages/home_screen/explore.dart';
import 'package:blogbox/src/presentation/pages/home_screen/following.dart';
import 'package:blogbox/src/presentation/pages/home_screen/headlines.dart';
import 'package:blogbox/src/presentation/pages/home_screen/published_articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTabIndexProvider = StateProvider<int>(
  (ref) => 0,
);

final tabItemPagesProvider = Provider<List<Widget>>((ref) {
  return [
    Explore(),
    Headlines(),
    const Following(),
    const ForYou(),
  ];
});

final tempArticlesProvider = Provider<List<Article>>((ref) {
  return [
    Article(
      title: 'Başlık 1',
      subtitle: 'Alt Başlık 1',
      publisher: 'New York Times',
      coverImageUrl:
          'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iRAEf1Iv0Tl8/v0/1200x800.jpg',
      images: [],
      category: 'News',
      subcategory: 'Global News',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description:
          'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 2',
      subtitle: 'Alt Başlık 2',
      publisher: 'Computer Science Daily',
      coverImageUrl:
          'https://miro.medium.com/v2/resize:fill:140:140/1*z_5sz44FOBGUwhQqplFotw.jpeg',
      images: [],
      category: 'Blog',
      subcategory: 'Computer Science',
      followers: 850,
      popularity: 7,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 3',
      subtitle: 'Alt Başlık 3',
      publisher: 'Towards Data Science',
      coverImageUrl:
          'https://miro.medium.com/v2/resize:fill:140:140/1*65HVWAnPQwOqwn01rMxdaA@2x.jpeg',
      images: [],
      category: 'Makale',
      subcategory: 'Data Sicence',
      followers: 6798,
      popularity: 10,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 4',
      subtitle: 'Alt Başlık 4',
      publisher: 'My English Journey',
      coverImageUrl:
          'https://miro.medium.com/v2/resize:fill:140:140/1*FO9ttU2wv3tu1OZyMfxc-Q.png',
      images: [],
      category: 'Blog',
      subcategory: 'Language Learning',
      followers: 1403,
      popularity: 4,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 5',
      subtitle: 'Alt Başlık 5',
      publisher: 'The Real Dictators',
      coverImageUrl:
          'https://miro.medium.com/v2/resize:fill:140:140/1*wd_HmipNaZS3-FWSgXc8WQ.jpeg',
      images: [],
      category: 'Biography',
      subcategory: 'Documentary',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 6',
      subtitle: 'Alt Başlık 6',
      publisher: 'Food Maniac',
      coverImageUrl:
          'https://miro.medium.com/v2/resize:fill:140:140/0*r761qpYUuP6g_cBR.jpg',
      images: [],
      category: 'Blog',
      subcategory: 'Daily Life',
      followers: 4989,
      popularity: 9,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 7',
      subtitle: 'Alt Başlık 7',
      publisher: 'Udemy Turkey',
      coverImageUrl:
          'https://miro.medium.com/v2/da:true/resize:fill:140:140/0*xiTpcRzd7eSsysX7',
      images: [],
      category: 'Blog',
      subcategory: 'Education',
      followers: 65000,
      popularity: 10,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 8',
      subtitle: 'Alt Başlık 8',
      publisher: 'Ubisoft Games',
      coverImageUrl:
          'https://upload.wikimedia.org/wikipedia/tr/9/9b/Far_Cry_6_Kapak_Resmi.jpg',
      images: [],
      category: 'Content',
      subcategory: 'Games',
      followers: 9458,
      popularity: 6,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 9',
      subtitle: 'Alt Başlık 9',
      publisher: 'BuzzFeed',
      coverImageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Mulholland_drive%28lynch%29--.jpg/225px-Mulholland_drive%28lynch%29--.jpg',
      images: [],
      category: 'Blog',
      subcategory: 'Travel',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 10',
      subtitle: 'Alt Başlık 10',
      publisher: 'CNN',
      coverImageUrl:
          'https://static01.nyt.com/images/2024/03/12/business/12dc-divisions/12dc-divisions-jumbo.png?quality=75&auto=webp',
      images: [],
      category: 'Article',
      subcategory: 'Politics',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 11',
      subtitle: 'Alt Başlık 11',
      publisher: 'ScreenGeek',
      coverImageUrl:
          'https://avatars.mds.yandex.net/i?id=ae9f42f34ff8b25d3f156e9297f6c6e5c5ee0cd0-7942262-images-thumbs&n=13',
      images: [],
      category: 'Corner Post',
      subcategory: 'Literature',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 11',
      subtitle: 'Alt Başlık 12',
      publisher: 'Daily Kos',
      coverImageUrl:
          'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iRAEf1Iv0Tl8/v0/1200x800.jpg',
      images: [],
      category: 'Cartoon',
      subcategory: 'Humor',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'https://miro.medium.com/v2/resize:fill:140:140/g:fp:0.52:0.5/1*-Y9ozbNWSViiCmal1TT32w.jpeg',
    ),
    Article(
      title: 'Başlık 13',
      subtitle: 'Alt Başlık 13',
      publisher: 'Sports Bible',
      coverImageUrl:
          'https://static01.nyt.com/images/2024/03/12/multimedia/12dc-transcript-cmzf/12dc-transcript-cmzf-jumbo.jpg?quality=75&auto=webp',
      images: [],
      category: 'News',
      subcategory: 'Sport News',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 14',
      subtitle: 'Alt Başlık 14',
      publisher: 'USA Today',
      coverImageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Zoran_%C4%90in%C4%91i%C4%87%2C_Davos.jpg/150px-Zoran_%C4%90in%C4%91i%C4%87%2C_Davos.jpg',
      images: [],
      category: 'Report',
      subcategory: 'Business',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 15',
      subtitle: 'Alt Başlık 15',
      publisher: 'Nasa Space',
      coverImageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Mars_Valles_Marineris.jpeg/450px-Mars_Valles_Marineris.jpeg',
      images: [],
      category: 'Documentary',
      subcategory: 'Space',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
    Article(
      title: 'Başlık 1',
      subtitle: 'Alt Başlık 2',
      publisher: 'Wikipedia',
      coverImageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/John_Pemberton.jpg/330px-John_Pemberton.jpg',
      images: [],
      category: 'Blog',
      subcategory: 'History',
      followers: 5000,
      popularity: 8,
      publishDate: '19 hours ago',
      description: 'Special Counsel Is Attacked From Both Sides Over Biden Documents Inquiry',
    ),
  ];
});

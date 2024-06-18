class Article {
  final String title;
  final String subtitle;
  final String description;
  final String publisher;
  final String coverImageUrl;
  final List<String> images;
  final String category;
  final String subcategory;
  final int followers;
  final int popularity;
  final String publishDate;

  Article(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.publisher,
      required this.coverImageUrl,
      required this.images,
      required this.category,
      required this.subcategory,
      required this.followers,
      required this.popularity,
      required this.publishDate});
}

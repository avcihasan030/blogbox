
class Blog {
  final dynamic claps;
  final dynamic date;
  final dynamic id;
  final dynamic image;
  final dynamic publication;
  final dynamic readingTime;
  final dynamic responses;
  final dynamic subtitle;
  final dynamic title;
  final dynamic url;
  bool isFavorite;

  Blog(
      {required this.claps,
      required this.date,
      required this.id,
      required this.image,
      required this.publication,
      required this.readingTime,
      required this.responses,
      required this.subtitle,
      required this.title,
      required this.url,
      this.isFavorite = false});


  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      claps: map['claps'],
      date: map['date'],
      id: map['id'],
      image: map['image'],
      publication: map['publication'],
      readingTime: map['readingTime'],
      responses: map['responses'],
      subtitle: map['subtitle'],
      title: map['title'],
      url: map['url'],
    );
  }
}

class Post {
  final String title;
  final String summary;
  final String url;

  Post({
    required this.title,
    required this.summary,
    required this.url,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title']['rendered'],
      summary: json['excerpt']['rendered'],
      url: json['link'],
    );
  }
}
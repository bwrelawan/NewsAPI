class DetailArticle {
  String? status;
  int? totalResults;
  List<Detail>? detailArticles;
  DetailArticle({
    this.status,
    this.totalResults,
    this.detailArticles,
  });

  factory DetailArticle.fromJson(Map<String, dynamic> json) => DetailArticle(
        status: json["status"],
        totalResults: json["totalResults"],
        detailArticles: json["articles"] == null
            ? []
            : List<Detail>.from(
                json["articles"]!.map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": detailArticles == null
            ? []
            : List<dynamic>.from(detailArticles!.map((x) => x.toJson())),
      };
}

class Detail {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Detail({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

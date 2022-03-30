class UnSplashPhotoModel {
  UnSplashPhotoModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });
  late final int total;
  late final int totalPages;
  late final List<UnSplashResults> results;

  factory UnSplashPhotoModel.fromJson(Map<String, dynamic> json){
    return UnSplashPhotoModel(
      total: json['total'],
      totalPages: json['total_pages'],
      results: List.from(json['results']).map((e)=>UnSplashResults.fromJson(e)).toList(),
    );
  }

}

class UnSplashResults {
  UnSplashResults({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    this.altDescription,
    required this.urls,
  });
  late final String? id;
  late final String? createdAt;
  late final String? updatedAt;
  late final int width;
  late final int height;
  late final String? color;
  late final String? blurHash;
  late final String? description;
  late final String? altDescription;
  late final Urls urls;

  factory UnSplashResults.fromJson(Map<String, dynamic> json){
    return UnSplashResults(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      description: json['description'],
      altDescription: json['alt_description'],
      urls: Urls.fromJson(json['urls']),);
  }
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });
  late final String raw;
  late final String full;
  late final String regular;
  late final String small;
  late final String thumb;
  late final String smallS3;

  factory Urls.fromJson(Map<String, dynamic> json){
    return Urls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
      smallS3: json['small_s3'],
    );
  }
}
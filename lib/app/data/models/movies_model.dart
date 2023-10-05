class MoviesModel {
  MoviesModel({
    this.title,
    this.image,
    this.details,
  });
  final String? title;
  final String? image;
  final String? details;
  static MoviesModel fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json['title'],
      image: json['image'],
      details: json['details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'details': details,
    };
  }
}

class MoviesModel {
  MoviesModel({
    this.title,
    this.imageUrl,
    this.details,
  });
  final String? title;
  final String? imageUrl;
  final String? details;
  static MoviesModel fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json['l'],
      imageUrl: json['imageUrl'],
      details: json['details'],
    );
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class SeriesModel {
  String? backdroppath;
  String? firstairdate;
  int? id;
  String? name;
  List<String?>? origincountry;
  String? originallanguage;
  String? originalname;
  String? overview;
  double? popularity;
  String? posterpath;
  double? voteaverage;
  int? votecount;
  SeriesModel(
      {this.backdroppath,
      this.firstairdate,
      this.id,
      this.name,
      this.origincountry,
      this.originallanguage,
      this.originalname,
      this.overview,
      this.popularity,
      this.posterpath,
      this.voteaverage,
      this.votecount});
  SeriesModel.fromJson(Map<String, dynamic> json) {
    backdroppath = json['backdrop_path'];
    firstairdate = json['first_air_date'];
    id = json['id'];
    name = json['name'];
    if (json['origin_country'] != null) {
      origincountry = <String>[];
      json['origin_country'].forEach((v) {
        origincountry!.add(v);
      });
    }
    originallanguage = json['original_language'];
    originalname = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterpath = json['poster_path'];
    voteaverage = json['vote_average'].toDouble();
    votecount = json['vote_count'];
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class FinalMoviesModel {
  bool? adult;
  String? backdroppath;
  int? id;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  double? popularity;
  String? posterpath;
  String? releasedate;
  String? title;
  bool? video;
  double? voteaverage;
  int? votecount;
  FinalMoviesModel(
      {this.adult,
      this.backdroppath,
      this.id,
      this.originallanguage,
      this.originaltitle,
      this.overview,
      this.popularity,
      this.posterpath,
      this.releasedate,
      this.title,
      this.video,
      this.voteaverage,
      this.votecount});
  FinalMoviesModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];
    id = json['id'];
    originallanguage = json['original_language'];
    originaltitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterpath = json['poster_path'];
    releasedate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteaverage = json['vote_average'].toDouble();
    votecount = json['vote_count'];
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class SearchSeriesModel {
  bool? adult;
  String? backdroppath;
  int? id;
  String? name;
  String? originallanguage;
  String? originalname;
  String? originalTitle;
  String? overview;
  String? posterpath;
  String? mediatype;
  double? popularity;
  String? firstairdate;
  String? releasedate;
  double? voteaverage;
  int? votecount;
  List<String?>? origincountry;
  SearchSeriesModel({
    this.adult,
    this.backdroppath,
    this.id,
    this.name,
    this.originallanguage,
    this.originalname,
    this.originalTitle,
    this.overview,
    this.posterpath,
    this.mediatype,
    this.popularity,
    this.firstairdate,
    this.releasedate,
    this.voteaverage,
    this.votecount,
    this.origincountry,
  });
  SearchSeriesModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originallanguage = json['original_language'];
    originalname = json['original_name'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterpath = json['poster_path'];
    mediatype = json['media_type'];
    popularity = json['popularity'];
    firstairdate = json['first_air_date'];
    releasedate = json['release_date'];
    voteaverage = json['vote_average'];
    votecount = json['vote_count'];
    if (json['origin_country'] != null) {
      origincountry = <String>[];
      json['origin_country'].forEach((v) {
        origincountry!.add(v);
      });
    }
  }
}

/* class SearchSeriesModel {
    SearchSeriesModel({
        this.adult,
        this.backdropPath,
        this.id,
        this.name,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.firstAirDate,
        this.voteAverage,
        this.voteCount,
        this.originCountry,
        this.title,
        this.originalTitle,
        this.releaseDate,
        this.video,
        this.gender,
        this.knownForDepartment,
        this.profilePath,
        this.knownFor,
    });
    bool adult;
    String backdropPath;
    int id;
    String name;
    OriginalLanguage originalLanguage;
    String originalName;
    String overview;
    String posterPath;
    MediaType mediaType;
    List<int> genreIds;
    double popularity;
    DateTime firstAirDate;
    double voteAverage;
    int voteCount;
    List<String> originCountry;
    String title;
    String originalTitle;
    String releaseDate;
    bool video;
    int gender;
    String knownForDepartment;
    dynamic profilePath;
    List<KnownFor> knownFor;
}
class KnownFor {
    KnownFor({
        this.adult,
        this.backdropPath,
        this.id,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount,
    });
    bool adult;
    String backdropPath;
    int id;
    String title;
    String originalLanguage;
    String originalTitle;
    String overview;
    String posterPath;
    MediaType mediaType;
    List<int> genreIds;
    double popularity;
    DateTime releaseDate;
    bool video;
    int voteAverage;
    int voteCount;
}
enum MediaType { TV, MOVIE, PERSON }
enum OriginalLanguage { EN, JA }
 */
/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class DMoviesModel {
  I? i;
  String? id;
  String? l;
  String? q;
  String? qid;
  int? rank;
  String? s;
  int? y;
  String? yr;
  DMoviesModel(
      {this.i,
      this.id,
      this.l,
      this.q,
      this.qid,
      this.rank,
      this.s,
      this.y,
      this.yr});
  DMoviesModel.fromJson(Map<String, dynamic> json) {
    i = json['i'] != null ? I?.fromJson(json['i']) : null;
    id = json['id'];
    l = json['l'];
    q = json['q'];
    qid = json['qid'];
    rank = json['rank'];
    s = json['s'];
    y = json['y'];
    yr = json['yr'];
  }
}

class I {
  int? height;
  String? imageUrl;
  int? width;
  I({this.height, this.imageUrl, this.width});
  I.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    imageUrl = json['imageUrl'];
    width = json['width'];
  }
}
// class Root {
//     List<DMoviesModel?>? d;
//     String? q;
//     int? v;
//     Root({this.d, this.q, this.v}); 
//     Root.fromJson(Map<String, dynamic> json) {
//         if (json['d'] != null) {
//          d = <D>[];
//          json['d'].forEach((v) {
//          d!.add(D.fromJson(v));
//         });
//       }
//         q = json['q'];
//         v = json['v'];
//     }
// }
